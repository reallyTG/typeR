library(midasr)


### Name: hAhr_test
### Title: Test restrictions on coefficients of MIDAS regression using
###   robust version of the test
### Aliases: hAhr_test

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
mr <- midas_r(y~fmls(x,4*12-1,12,theta_h0)-1,
              list(y=y,x=x),
              start=list(x=c(-0.1,0.1,-0.1,-0.001)))

##The gradient function
theta_h0_gradient <-function(p, dk,...) {
   i <- (1:dk-1)
   a <- exp(p[3]*i + p[4]*i^2)
   cbind(a, a*i, a*i*(p[1]+p[2]*i), a*i^2*(p[1]+p[2]*i))
}

##Perform test (the expected result should be the acceptance of null)

hAhr_test(mr)

mr <- midas_r(y~fmls(x,4*12-1,12,theta_h0)-1,
              list(y=y,x=x),
              start=list(x=c(-0.1,0.1,-0.1,-0.001)),
              weight_gradients=list())

##Use exact gradient. Note the 
hAhr_test(mr)




