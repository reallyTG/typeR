library(scout)


### Name: scout-package
### Title: Implements covariance-regularized regression, aka the Scout
###   Method.
### Aliases: scout-package scout-package
### Keywords: package

### ** Examples

library(lars)
data(diabetes)
attach(diabetes)
## Not run: cv.out <- cv.scout(x2,y,p1=1,p2=1,K=3)
## Not run: print(cv.out)
## Not run: out <- scout(x2,y,p1=1,p2=1,lam1=cv.out$bestlam1,lam2=cv.out$bestlam2)
## Not run: coef <- out$coef[1,1,]
detach(diabetes)



