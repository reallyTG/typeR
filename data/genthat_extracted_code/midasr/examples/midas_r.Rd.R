library(midasr)


### Name: midas_r
### Title: Restricted MIDAS regression
### Aliases: midas_r

### ** Examples

##The parameter function
theta_h0 <- function(p, dk, ...) {
   i <- (1:dk-1)/100
   pol <- p[3]*i + p[4]*i^2
   (p[1] + p[2]*i)*exp(pol)
}

##Generate coefficients
theta0 <- theta_h0(c(-0.1,10,-10,-10),4*12)

##Plot the coefficients
plot(theta0)

##Generate the predictor variable
xx <- ts(arima.sim(model = list(ar = 0.6), 600 * 12), frequency = 12)

##Simulate the response variable
y <- midas_sim(500, xx, theta0)

x <- window(xx, start=start(y))

##Fit restricted model
mr <- midas_r(y~fmls(x,4*12-1,12,theta_h0)-1,
              list(y=y,x=x),
              start=list(x=c(-0.1,10,-10,-10)))

##Include intercept and trend in regression
mr_it <- midas_r(y~fmls(x,4*12-1,12,theta_h0)+trend,
                 list(data.frame(y=y,trend=1:500),x=x),
                 start=list(x=c(-0.1,10,-10,-10)))

data("USrealgdp")
data("USunempr")

y.ar <- diff(log(USrealgdp))
xx <- window(diff(USunempr), start = 1949)
trend <- 1:length(y.ar)

##Fit AR(1) model
mr_ar <- midas_r(y.ar ~ trend + mls(y.ar, 1, 1) +
                 fmls(xx, 11, 12, nealmon),
                 start = list(xx = rep(0, 3)))

##First order MIDAS-AR* restricted model 
mr_arstar <-  midas_r(y.ar ~ trend + mls(y.ar, 1, 1, "*")
                     + fmls(xx, 11, 12, nealmon),
                     start = list(xx = rep(0, 3)))




