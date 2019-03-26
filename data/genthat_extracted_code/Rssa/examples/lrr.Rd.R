library(Rssa)


### Name: lrr
### Title: Calculate the Linear Recurrence Relation
### Aliases: lrr lrr.default lrr.ssa lrr.1d.ssa lrr.toeplitz.ssa roots
###   roots.lrr plot.lrr

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2, L = 24)
# Calculate the LRR out of first 3 eigentriples
l <- lrr(s, groups = list(1:3))
# Calculate the roots of the LRR
r <- roots(l)
# Moduli of the roots
Mod(r)
# Periods of three roots with maximal moduli
2*pi/Arg(r)[1:3]
# Plot the roots
plot(l)



