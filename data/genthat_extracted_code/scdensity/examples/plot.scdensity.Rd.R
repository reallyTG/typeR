library(scdensity)


### Name: plot.scdensity
### Title: Plot method for class 'scdensity'.
### Aliases: plot.scdensity

### ** Examples

# Basic usage:
x <- rlnorm(30)
scKDE <- scdensity(x)
plot(scKDE)

# Show only the constrained estimate
plot(scKDE, detail=1)

# Show the constrained and unconstrained estimates.  Change line color and width.
plot(scKDE, detail=2, col=c("red","blue"), lwd=c(3,2))

# Show the Q-Q plot, but change that plot's symbol and its size.
plot(scKDE, detail=4, pch=c(-1, -1, 3), cex=0.5)



