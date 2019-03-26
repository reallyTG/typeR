library(ordinal)


### Name: slice
### Title: Slice the likelihood of a clm
### Aliases: slice slice.clm plot.slice.clm
### Keywords: models

### ** Examples


## fit model:
fm1 <- clm(rating ~ contact + temp, data = wine)
## slice the likelihood:
sl1 <- slice(fm1)

## three different ways to plot the slices:
par(mfrow = c(2,3))
plot(sl1)
plot(sl1, type = "quadratic", plot.mle = FALSE)
plot(sl1, type = "linear")

## Verify convergence to the optimum:
sl2 <- slice(fm1, lambda = 1e-5, quad.approx = FALSE)
plot(sl2)




