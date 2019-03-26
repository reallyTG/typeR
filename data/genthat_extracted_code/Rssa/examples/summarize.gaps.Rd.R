library(Rssa)


### Name: summarize.gaps
### Title: Summarize Gaps in a Series
### Aliases: summarize.gaps summarize.gaps.ssa summarize.gaps.1d.ssa
###   summarize.gaps.toeplitz.ssa summarize.gaps.cssa
###   summarize.gaps.default

### ** Examples

# Produce series with gaps
F <- co2; F[c(12, 100:200, 250)] <- NA
# Summarize the gaps
s <- ssa(F, L = 72)
g <- summarize.gaps(s, L = c(36, 72, 144))
# Print the results
print(g)
# Plot the proportion of complete lag-vectors
plot(g)



