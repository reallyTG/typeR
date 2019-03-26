library(midasr)


### Name: midas_u
### Title: Estimate unrestricted MIDAS regression
### Aliases: midas_u

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
##Do not run
#plot(theta0)

##' ##Generate the predictor variable
xx <- ts(arima.sim(model = list(ar = 0.6), 600 * 12), frequency = 12)

##Simulate the response variable
y <- midas_sim(500, xx, theta0)

x <- window(xx, start=start(y))

##Create low frequency data.frame
ldt <- data.frame(y=y,trend=1:length(y))

##Create high frequency data.frame

hdt <- data.frame(x=window(x, start=start(y)))

##Fit unrestricted model
mu <- midas_u(y~fmls(x,2,12)-1, list(ldt, hdt))

##Include intercept and trend in regression

mu_it <- midas_u(y~fmls(x,2,12)+trend, list(ldt, hdt))

##Pass data as partialy named list

mu_it <- midas_u(y~fmls(x,2,12)+trend, list(ldt, x=hdt$x))




