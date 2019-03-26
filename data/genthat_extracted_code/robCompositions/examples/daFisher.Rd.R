library(robCompositions)


### Name: daFisher
### Title: Discriminant analysis by Fisher Rule.
### Aliases: daFisher print.daFisher print.daFisher predict.daFisher
###   summary.daFisher
### Keywords: multivariate

### ** Examples

## toy data (non-compositional)
require(MASS)
x1 <- mvrnorm(20,c(0,0,0),diag(3))
x2 <- mvrnorm(30,c(3,0,0),diag(3))
x3 <- mvrnorm(40,c(0,3,0),diag(3))
X <- rbind(x1,x2,x3)
grp=c(rep(1,20),rep(2,30),rep(3,40))

#par(mfrow=c(1,2))
d1 <- daFisher(X,grp=grp,method="classical",coda=FALSE)
d2 <- daFisher(X,grp=grp,method="robust",coda=FALSE)
d2
summary(d2)
predict(d2, newdata = X)

## example with olive data:
## Not run: 
##D data(olive, package = "RnavGraph")
##D # exclude zeros (alternatively impute them if 
##D # the detection limit is known using impRZilr())
##D ind <- which(olive == 0, arr.ind = TRUE)[,1]
##D olives <- olive[-ind, ]
##D x <- olives[, 4:10]
##D grp <- olives$Region # 3 groups
##D res <- daFisher(x,grp)
##D res
##D summary(res)
##D res <- daFisher(x, grp, plotScore = TRUE)
##D res <- daFisher(x, grp, method = "robust")
##D res
##D summary(res)
##D predict(res, newdata = x)
##D res <- daFisher(x,grp, plotScore = TRUE, method = "robust")
##D 
##D # 9 regions
##D grp <- olives$Area
##D res <- daFisher(x, grp, plotScore = TRUE)
##D res
##D summary(res)
##D predict(res, newdata = x)
## End(Not run)



