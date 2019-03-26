library(FSA)


### Name: rSquared
### Title: Extract the coefficient of determination from a linear model
###   object.
### Aliases: rSquared rSquared.default rSquared.lm
### Keywords: misc

### ** Examples

lm1 <- lm(mirex~weight, data=Mirex)
rSquared(lm1)
rSquared(lm1,digits=3)
rSquared(lm1,digits=1,percent=TRUE)

## rSquared only works with lm objects
## Not run: 
##D nls1 <- nls(mirex~a*weight^b,data=Mirex,start=list(a=1,b=1))
##D rSquared(nls1)
## End(Not run)




