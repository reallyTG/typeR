library(GCalcium)


### Name: z_score
### Title: Transform values into z scores
### Aliases: z_score

### ** Examples

# Format data
df.new <- format_data(GCaMP)

# Split data
basevals <- df.new$Trial1[df.new$Time <= 0]
eventvals <- df.new$Trial1[df.new$Time > 0]

# Find baseline (pre-epoc) values
base.mu <- mean(basevals)
base.sigma <- sd(basevals)

# Compute values
z_score(x = eventvals, mu = base.mu, sigma = base.sigma)



