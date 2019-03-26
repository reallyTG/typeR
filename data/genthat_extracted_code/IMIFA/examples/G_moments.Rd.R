library(IMIFA)


### Name: G_moments
### Title: 1st & 2nd Moments of the Pitman-Yor / Dirichlet Processes
### Aliases: G_moments G_expected G_variance
### Keywords: utility

### ** Examples

G_expected(N=50, alpha=19.23356)
G_variance(N=50, alpha=19.23356)

# require("Rmpfr")
# G_expected(N=50, alpha=c(19.23356, 12.21619, 1), discount=c(0, 0.25, 0.7300045))
# G_variance(N=50, alpha=c(19.23356, 12.21619, 1), discount=c(0, 0.25, 0.7300045))

# Examine the growth rate of the DP
DP   <- sapply(c(1, 5, 10), function(i) G_expected(1:200, alpha=i))
matplot(DP, type="l", xlab="N", ylab="G")

# Examine the growth rate of the PYP
# PY <- sapply(c(0.1, 0.25, 0.5), function(i) G_expected(1:200, alpha=1, discount=i))
# matplot(PY, type="l", xlab="N", ylab="G")



