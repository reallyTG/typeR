library(kyotil)


### Name: Deming
### Title: Fit Deming regression.
### Aliases: Deming coef.Deming vcov.Deming getFixedEf.Deming
###   predict.Deming summary.Deming

### ** Examples


## Not run: 
##D set.seed(1)
##D x=rnorm(100,0,1)
##D y=x+rnorm(100,0,.5)
##D x=x+rnorm(100,0,.5)
##D fit=Deming(x,y, boot=TRUE)
##D summary(fit)
##D plot(x,y)
##D abline(fit)
##D # compare with lm fit
##D fit.1=lm(y~x, data.frame(x,y))
##D summary(fit.1)
##D abline(fit.1, col=2)
## End(Not run)



