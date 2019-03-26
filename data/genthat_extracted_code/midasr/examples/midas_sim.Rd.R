library(midasr)


### Name: midas_sim
### Title: Simulate simple MIDAS regression response variable
### Aliases: midas_sim

### ** Examples

##The parameter function
theta_h0 <- function(p, dk) {
   i <- (1:dk-1)/100
   pol <- p[3]*i + p[4]*i^2
   (p[1] + p[2]*i)*exp(pol)
}

##Generate coefficients
theta0 <- theta_h0(c(-0.1,10,-10,-10),4*12)

##Plot the coefficients
plot(theta0)

##Generate the predictor variable, leave 4 low frequency lags of data for burn-in.
xx <- ts(arima.sim(model = list(ar = 0.6), 600 * 12), frequency = 12)

##Simulate the response variable
y <- midas_sim(500, xx, theta0)

x <- window(xx, start=start(y))
midas_r(y ~ mls(y, 1, 1) + fmls(x, 4*12-1, 12, theta_h0), start = list(x = c(-0.1, 10, -10, -10)))




