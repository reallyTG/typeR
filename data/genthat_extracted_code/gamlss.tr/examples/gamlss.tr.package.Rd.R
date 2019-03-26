library(gamlss.tr)


### Name: gamlss.tr-package
### Title: Generating and Fitting Truncated 'gamlss.family' Distributions
### Aliases: gamlss.tr-package gamlss.tr
### Keywords: package distribution regression

### ** Examples

# generating a t-distribution from 0 to 100  	
gen.trun(par=c(0,100),family="TF", name="0to100", type="both")
op<-par(mfrow=c(2,2))
plot(function(x) dTF0to100(x, mu=80 ,sigma=20, nu=5), 0, 100, ylab="pdf")
plot(function(x) pTF0to100(x, mu=80 ,sigma=20, nu=5), 0, 100, ylab="cdf")
plot(function(x) qTF0to100(x, mu=80 ,sigma=20, nu=5), 0.01, .999, ylab="invcdf")
hist(s1<-rTF0to100(1000, mu=80 ,sigma=20, nu=5), ylab="hist", xlab="x", main="generated data")
par(op)



