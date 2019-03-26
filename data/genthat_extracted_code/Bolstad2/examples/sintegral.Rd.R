library(Bolstad2)


### Name: sintegral
### Title: Numerical integration using Simpson's Rule
### Aliases: sintegral
### Keywords: misc

### ** Examples

## integrate the normal density from -3 to 3
x<-seq(-3,3,length=100)
fx<-dnorm(x)
estimate<-sintegral(x,fx)$int
true.val<-diff(pnorm(c(-3,3)))
cat(paste("Absolute error :",round(abs(estimate-true.val),7),"\n"))
cat(paste("Relative percentage error :", 100*round((abs(estimate-true.val)/true.val),6),"%\n"))



