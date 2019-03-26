library(midasr)


### Name: midas_auto_sim
### Title: Simulate simple autoregressive MIDAS model
### Aliases: midas_auto_sim

### ** Examples

theta_h0 <- function(p, dk) {
  i <- (1:dk-1)/100
  pol <- p[3]*i + p[4]*i^2
  (p[1] + p[2]*i)*exp(pol)
}

##Generate coefficients
theta0 <- theta_h0(c(-0.1,10,-10,-10),4*12)

##Generate the predictor variable
xx <- ts(arima.sim(model = list(ar = 0.6), 1000 * 12), frequency = 12)

y <- midas_auto_sim(500, 0.5, xx, theta0, n_start = 200)
x <- window(xx, start=start(y))
midas_r(y ~ mls(y, 1, 1) + fmls(x, 4*12-1, 12, theta_h0), start = list(x = c(-0.1, 10, -10, -10)))



