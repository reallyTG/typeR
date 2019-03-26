library(FSA)


### Name: extraTests
### Title: Likelihood ratio and extra sum-of-squares tests.
### Aliases: extraTests lrt extraSS print.extraTest
### Keywords: htest

### ** Examples

## Example data
df <- data.frame(x=c(1,2,3,4,5,6,7,8,9,10),
                 y=c(4,6,5,7,9,8,7,12,16,22),
                 z=as.factor(rep(c("A","B"),each=5)),
                 w=as.factor(rep(c("A","B"),times=5)))
df$x2 <- df$x^2

## Linear (lm()) models
#  ... regression
fit.0 <- lm(y~1,data=df)
fit.1 <- lm(y~x,data=df)
fit.2 <- lm(y~x2+x,data=df)
extraSS(fit.0,fit.1,com=fit.2)
lrt(fit.0,fit.1,com=fit.2)

# ... show labels for models
extraSS(fit.0,fit.1,com=fit.2,
    sim.names=c("Null Model","Linear"),com.name="Quadratic")
lrt(fit.0,fit.1,com=fit.2,
    sim.names=c("Null Model","Linear"),com.name="Quadratic")

#  ... dummy variable regression
fit.2b <- lm(y~x*z,data=df)
extraSS(fit.0,fit.1,com=fit.2b)
lrt(fit.0,fit.1,com=fit.2b)

#  ... ANOVAs
fit.1 <- lm(y~w,data=df)
fit.2 <- lm(y~w*z,data=df)
extraSS(fit.0,fit.1,com=fit.2)
lrt(fit.0,fit.1,com=fit.2)


## Non-linear (nls()) models
fit.0 = nls(y~c,data=df,start=list(c=10))
fit.1 = nls(y~a*x+c,data=df,start=list(a=1,c=1))
fit.2 = nls(y~b*x2+a*x+c,data=df,start=list(a=-1,b=0.3,c=10))
extraSS(fit.0,fit.1,com=fit.2)
lrt(fit.0,fit.1,com=fit.2)

## General least-squares (gls()) models
## Not run: 
##D   require(nlme)
##D   fit.0 <- gls(y~1,data=df,method="ML")
##D   fit.1 <- gls(y~x,data=df,method="ML")
##D   fit.2 <- gls(y~x2+x,data=df,method="ML")
##D   lrt(fit.0,fit.1, com=fit.2)
##D   ## will return an error ... does not work with gls() models
##D   # extraSS(fit.0,fit.1, com=fit.2)
## End(Not run)




