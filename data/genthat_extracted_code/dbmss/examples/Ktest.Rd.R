library(dbmss)


### Name: Ktest
### Title: Test of a point pattern against Complete Spatial Randomness
### Aliases: Ktest

### ** Examples

# Simulate a Matern (Neyman Scott) point pattern
nclust <- function(x0, y0, radius, n) {
  return(runifdisc(n, radius, centre=c(x0, y0)))
}
X <- rNeymanScott(20, 0.1, nclust, radius=0.2, n=5)
plot(X)

# Test it
Ktest(X, r=seq(0.1, .5, .1))



