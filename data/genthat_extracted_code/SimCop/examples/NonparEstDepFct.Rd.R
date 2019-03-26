library(SimCop)


### Name: NonparEstDepFct
### Title: Nonparametric estimator of bivariate dependence function
### Aliases: NonparEstDepFct
### Keywords: nonparametric

### ** Examples

## Data from Hall and Tajvidi (2004, ANZJS)
EstDF1 <- NonparEstDepFct(MaxTemp)

## Plot modified Pickands Function and area in which
## dependence function must lie
plot(EstDF1, ylim = c(0.5,1), xlab = "w", ylab = "A(w)", type="l", lty="longdash")
polygon(c(0, 0.5, 1, 0), c(1, 0.5, 1, 1))




