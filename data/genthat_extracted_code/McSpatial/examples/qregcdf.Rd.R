library(McSpatial)


### Name: qregcdf
### Title: Nonparametric quantiles based on conditional CDF functions
### Aliases: qregcdf
### Keywords: Quantile Regression Nonparametric Conditional Density

### ** Examples

data(dupage99)
dupage99$ratio <- dupage99$av/dupage99$price
o <- order(dupage99$price)
dupage99 <- dupage99[o,]
attach(dupage99)
price <- price/1000

fit <- qregcdf(ratio~price)
ymin = min(fit$yhat)
ymax = max(fit$yhat)
plot(price, fit$yhat[,1],type="l",xlab="Sales Price (1000s)",ylab="Assessment Ratio",
  ylim=c(ymin,ymax),main="Nonparametric Conditional CDF Quantile Regression")
for (j in seq(2,5)) {
  lines(price,fit$yhat[,j])
}
fit$hx
fit$hy




