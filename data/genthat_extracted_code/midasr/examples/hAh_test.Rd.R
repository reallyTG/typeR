library(midasr)


### Name: hAh_test
### Title: Test restrictions on coefficients of MIDAS regression
### Aliases: hAh_test

### ** Examples

##The parameter function
theta_h0 <- function(p, dk, ...) {
   i <- (1:dk-1)
   (p[1] + p[2]*i)*exp(p[3]*i + p[4]*i^2)
}

##Generate coefficients
theta0 <- theta_h0(c(-0.1,0.1,-0.1,-0.001),4*12)

##Plot the coefficients
plot(theta0)

##Generate the predictor variable
set.seed(13)

xx <- ts(arima.sim(model = list(ar = 0.6), 600 * 12), frequency = 12)

##Simulate the response variable
y <- midas_sim(500, xx, theta0)

x <- window(xx, start=start(y))
##Fit restricted model
mr <- midas_r(y~fmls(x,4*12-1,12,theta_h0)-1,list(y=y,x=x),
              start=list(x=c(-0.1,0.1,-0.1,-0.001)))

##Perform test (the expected result should be the acceptance of null)

hAh_test(mr)

##Fit using gradient function

##The gradient function
theta_h0_gradient<-function(p, dk,...) {
   i <- (1:dk-1)
   a <- exp(p[3]*i + p[4]*i^2)
   cbind(a, a*i, a*i*(p[1]+p[2]*i), a*i^2*(p[1]+p[2]*i))
}

mr <- midas_r(y~fmls(x,4*12-1,12,theta_h0)-1,list(y=y,x=x),
              start=list(x=c(-0.1,0.1,-0.1,-0.001)),
              weight_gradients=list())

##The test will use an user supplied gradient of weight function. See the
##help of midas_r on how to supply the gradient.

hAh_test(mr)





