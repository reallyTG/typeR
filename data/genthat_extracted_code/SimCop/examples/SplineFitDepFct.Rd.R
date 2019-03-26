library(SimCop)


### Name: SplineFitDepFct
### Title: Fit a dependence function by spline smoothing
### Aliases: SplineFitDepFct
### Keywords: smooth

### ** Examples

## Data from Hall and Tajvidi (2004, ANZJS)
EstDF2 <- NonparEstDepFct(MaxTemp, convex = FALSE)

## Plot modified Pickands Function and area in which
## dependence function must lie
plot(EstDF2, ylim = c(0.5,1), xlab = "w", ylab = "A(w)", type="l", lty="longdash")
polygon(c(0, 0.5, 1, 0), c(1, 0.5, 1, 1))

## Fit spline to Pickands function and add to plot
splfit <- SplineFitDepFct(EstDF2)
curve(splfit, n = 301, add = TRUE, lty = "dashed")




