library(dbmss)


### Name: GoFtest
### Title: Goodness of Fit test between a distance based measure of spatial
###   structure and simulations of its null hypothesis
### Aliases: GoFtest

### ** Examples

# Simulate a Matern (Neyman Scott) point pattern
nclust <- function(x0, y0, radius, n) {
  return(runifdisc(n, radius, centre=c(x0, y0)))
}
X <- rNeymanScott(20, 0.2, nclust, radius=0.3, n=10)
plot(X)

# Calculate confidence envelope (should be 1000 simulations, reduced to 50 to save time)
r <- seq(0, 0.3, 0.01)
NumberOfSimulations <- 50
Alpha <- .10
Envelope <- KEnvelope(as.wmppp(X), r, NumberOfSimulations, Alpha)
plot(Envelope, ./(pi*r^2) ~ r)

# GoF test. Power is correct if enough simulations are run (say >1000).
paste("p-value =", GoFtest(Envelope))



