library(rrcovHD)


### Name: SosDiscRobust
### Title: Robust and sparse multigroup classification by the optimal
###   scoring approach
### Aliases: SosDiscRobust SosDiscRobust.default SosDiscRobust.formula
### Keywords: robust multivariate classification sparse

### ** Examples


## EXAMPLE 1 ######################################
data(olitos)
grind <- which(colnames(olitos)=="grp")

set.seed(5008642)
mod <- SosDiscRobust(grp~., data=olitos, lambda=0.3, maxIte=30, Q=3, tol=1e-2)

pred <- predict(mod, newdata=olitos[,-grind])

summary(mod)
plot(mod, ind=c(1:3))


## EXAMPLE 2 ######################################
##

## Not run: 
##D library(sparseLDA)
##D data(penicilliumYES)
##D 
##D ## for demonstration only:
##D set.seed(5008642)
##D X <- penicilliumYES$X[, sample(1:ncol(penicilliumYES$X), 100)]
##D 
##D ## takes a subsample of the variables
##D ## to have quicker computation time
##D 
##D colnames(X) <- paste0("V",1:ncol(X))
##D y <- as.factor(c(rep(1,12), rep(2,12), rep(3,12)))
##D 
##D set.seed(5008642)
##D mod <- SosDiscRobust(X, y, lambda=1, maxit=5, Q=2, tol=1e-2)
##D 
##D summary(mod)
##D plot(mod)
## End(Not run)




