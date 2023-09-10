# FROM oven/bun:1.0 AS deps
# WORKDIR /deps
# COPY package.json bun.lockb ./
# RUN bun install

# FROM oven/bun:1.0 AS builder
# WORKDIR /build
# COPY --from=deps /deps/node_modules ./node_modules
# COPY . .
# RUN bun run build

# FROM oven/bun:1.0 AS runner
# WORKDIR /app
# COPY --from=builder /build/node_modules ./node_modules
# COPY --from=builder /build/.next ./.next
# COPY --from=builder /build/package.json ./package.json
# COPY --from=builder /build/public ./public
# COPY --from=builder /build/next.config.js ./next.config.js

# RUN ls

# CMD [ "bun", "start" ]

FROM oven/bun:1.0 AS all
WORKDIR /app
COPY . .
RUN bun install
RUN bun run build
CMD ["bun", "run", "start"]



