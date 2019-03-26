library(genridge)


### Name: traceplot
### Title: Univariate ridge trace plots
### Aliases: traceplot
### Keywords: hplot

### ** Examples

longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)

traceplot(lridge)
#abline(v=lridge$kLW, lty=3)
#abline(v=lridge$kHKB, lty=3)
#text(lridge$kLW, -3, "LW")
#text(lridge$kHKB, -3, "HKB")

traceplot(lridge, X="df")




