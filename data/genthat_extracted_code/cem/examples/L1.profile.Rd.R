library(cem)


### Name: L1.profile
### Title: Calculates L1 distance for different coarsenings
### Aliases: L1.profile
### Keywords: datagen

### ** Examples

## Not run: 
##D data(LL)
##D for(i in c(4:6,10:12))
##D  LL[[i]] <- factor(LL[[i]])
##D 
##D imb0 <- L1.profile(LL$treated,LL, drop=c("treated","re78"))
##D 
##D if(require(MatchIt)){
##D  m2 <- matchit(treated ~ black + hispanic + married + nodegree + 
##D   u74 + u75 + education + age + re74 + re75, data=LL, 
##D   distance="logit")
##D 
##D  m3 <- matchit(treated ~ black + hispanic + married + nodegree + 
##D   u74 + u75 + education + age + re74 + re75, data=LL, 
##D   distance="mahalanobis")
##D  
##D  L1.profile(LL$treated,LL, drop=c("treated","re78"), 
##D   weights=m2$w, add=TRUE, col="green", lty=2, useCP=imb0$CP)
##D 
##D  L1.profile(LL$treated,LL, drop=c("treated","re78"), 
##D   weights=m3$w, add=TRUE, col="orange", lty=3, useCP=imb0$CP)
##D }
##D 
##D m1 <- cem("treated", LL, drop="re78")
##D 
##D L1.profile(LL$treated,LL, drop=c("treated","re78"), 
##D  weights=m1$w>0, add=TRUE, col="blue", lty=4, useCP=imb0$CP)
##D 
##D legend(5, 0.9, legend=c("raw data", "pscore", "mahalanobis", "cem"), 
##D  lty=1:4, col=c("red", "green", "orange", "blue"))
## End(Not run)



