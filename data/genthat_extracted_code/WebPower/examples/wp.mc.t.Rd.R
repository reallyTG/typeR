library(WebPower)


### Name: wp.mc.t
### Title: Power analysis for t-test based on Monte Carlo simulation
### Aliases: wp.mc.t

### ** Examples

## No test: 
########## Chapter 16. Monte Carlo t-test #############
wp.mc.t(n=20 , mu0=0, mu1=0.5, sd=1, skewness=0, 
kurtosis=3, type = c("one.sample"), alternative = c("two.sided"))

wp.mc.t(n=40 , mu0=0, mu1=0.3, sd=1, skewness=1, 
kurtosis=6, type = c("paired"), alternative = c("greater"))

wp.mc.t(n=c(15, 15), mu1=c(0.2, 0.5), sd=c(0.2, 0.5), 
skewness=c(1, 2), kurtosis=c(4, 6), type = c("two.sample"), alternative = c("less"))
## End(No test)




