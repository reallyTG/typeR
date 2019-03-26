library(scout)


### Name: cv.scout
### Title: Perform cross-validation for covariance-regularized regression,
###   aka the Scout.
### Aliases: cv.scout

### ** Examples

library(lars)
data(diabetes)
attach(diabetes)
par(mfrow=c(2,1))
par(mar=c(2,2,2,2))
## Not run: cv.sc <- cv.scout(x2,y,p1=2,p2=1)
## Not run: print(cv.sc)
## Not run: cv.la <- cv.lars(x2,y)
## Not run: print(c("Lars minimum CV is ", min(cv.la$cv)))
## Not run: print(c("Scout(2,1) minimum CV is ", min(cv.sc$cv)))
detach(diabetes)



