library(bbmle)


### Name: mle2-class
### Title: Class "mle2". Result of Maximum Likelihood Estimation.
### Aliases: mle2-class coef,mle2-method show,mle2-method slice,mle2-method
###   summary,mle2-method update,mle2-method vcov,mle2-method
###   deviance,mle2-method coerce,mle,mle2-method formula,mle2-method stdEr
###   stdEr,mle2-method
### Keywords: classes

### ** Examples

x <- 0:10
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
lowerbound <- c(a=2,b=-0.2)
d <- data.frame(x,y)
fit1 <- mle2(y~dpois(lambda=exp(a+b*x)),start=list(a=0,b=2),data=d,
method="L-BFGS-B",lower=c(a=2,b=-0.2))
(cc <- confint(fit1,quietly=TRUE))
## to set the lower bounds to the limit
na_lower <- is.na(cc[,1])
cc[na_lower,1] <- lowerbound[na_lower]
cc



