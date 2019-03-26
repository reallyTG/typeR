library(bamlss)


### Name: sliceplot
### Title: Plot Slices of Bivariate Functions
### Aliases: sliceplot
### Keywords: hplot

### ** Examples

## Generate some data.
set.seed(111)
n <- 500

## Regressors.
d <- data.frame(z = runif(n, -3, 3), w = runif(n, 0, 6))

## Response.
d$y <- with(d, 1.5 + cos(z) * sin(w) + rnorm(n, sd = 0.6))

## Not run: 
##D ## Estimate model.
##D b <- bamlss(y ~ te(z, w), data = d)
##D summary(b)
##D 
##D ## Plot estimated effect.
##D plot(b, term = "te(z,w)", sliceplot = TRUE)
##D plot(b, term = "te(z,w)", sliceplot = TRUE, view = 2)
##D plot(b, term = "te(z,w)", sliceplot = TRUE, view = "w")
##D plot(b, term = "te(z,w)", sliceplot = TRUE, probs = seq(0, 1, length = 10))
## End(Not run)

## Variations.
d$f1 <- with(d, sin(z) * cos(w))
sliceplot(cbind(z = d$z, w = d$w, f1 = d$f1))

## Same with formula. 
sliceplot(sin(z) * cos(w) ~ z + w, ylab = "f(z)", data = d)

## Compare with plot3d().
plot3d(sin(z) * 1.5 * w ~ z + w, zlab = "f(z,w)", data = d)
sliceplot(sin(z) * 1.5 * w ~ z + w, ylab = "f(z)", data = d)
sliceplot(sin(z) * 1.5 * w ~ z + w, view = 2, ylab = "f(z)", data = d)



