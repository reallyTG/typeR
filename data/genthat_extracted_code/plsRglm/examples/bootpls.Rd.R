library(plsRglm)


### Name: bootpls
### Title: Non-parametric Bootstrap for PLS models
### Aliases: bootpls
### Keywords: models

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

# Lazraq-Cleroux PLS ordinary bootstrap
set.seed(250)
modpls <- plsR(yCornell,XCornell,3)

#(Y,X) resampling
Cornell.bootYX <- bootpls(modpls, R=250)

#(Y,T) resampling
Cornell.bootYT <- bootpls(modpls, typeboot="fmodel_np", R=250)

# Using the boxplots.bootpls function
boxplots.bootpls(Cornell.bootYX,indices=2:8)
# Confidence intervals plotting
confints.bootpls(Cornell.bootYX,indices=2:8)
plots.confints.bootpls(confints.bootpls(Cornell.bootYX,indices=2:8))
# Graph similar to the one of Bastien et al. in CSDA 2005
boxplot(as.vector(Cornell.bootYX$t[,-1])~factor(rep(1:7,rep(250,7))), 
main="Bootstrap distributions of standardised bj (j = 1, ..., 7).")
points(c(1:7),Cornell.bootYX$t0[-1],col="red",pch=19)


## No test: 
library(boot)
boot.ci(Cornell.bootYX, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=2)
plot(Cornell.bootYX,index=2)
jack.after.boot(Cornell.bootYX, index=2, useJ=TRUE, nt=3)
plot(Cornell.bootYX,index=2,jack=TRUE)

car::dataEllipse(Cornell.bootYX$t[,2], Cornell.bootYX$t[,3], cex=.3, 
levels=c(.5, .95, .99), robust=TRUE)
rm(Cornell.bootYX)


# PLS balanced bootstrap

set.seed(225)
Cornell.bootYX <- bootpls(modpls, sim="balanced", R=250)
boot.array(Cornell.bootYX, indices=TRUE)

# Using the boxplots.bootpls function
boxplots.bootpls(Cornell.bootYX,indices=2:8)
# Confidence intervals plotting
confints.bootpls(Cornell.bootYX,indices=2:8)
plots.confints.bootpls(confints.bootpls(Cornell.bootYX,indices=2:8))
# Graph similar to the one of Bastien et al. in CSDA 2005
boxplot(as.vector(Cornell.bootYX$t[,-1])~factor(rep(1:7,rep(250,7))), 
main="Bootstrap distributions of standardised bj (j = 1, ..., 7).")
points(c(1:7),Cornell.bootYX$t0[-1],col="red",pch=19)


library(boot)
boot.ci(Cornell.bootYX, conf = c(0.90,0.95), type = c("norm","basic","perc","bca"), index=2)
plot(Cornell.bootYX,index=2)
jack.after.boot(Cornell.bootYX, index=2, useJ=TRUE, nt=3)
plot(Cornell.bootYX,index=2,jack=TRUE)

rm(Cornell.bootYX)

# PLS permutation bootstrap

set.seed(500)
Cornell.bootYX <- bootpls(modpls, sim="permutation", R=1000)
boot.array(Cornell.bootYX, indices=TRUE)


# Graph of bootstrap distributions
boxplot(as.vector(Cornell.bootYX$t[,-1])~factor(rep(1:7,rep(1000,7))),
main="Bootstrap distributions of standardised bj (j = 1, ..., 7).")
points(c(1:7),Cornell.bootYX$t0[-1],col="red",pch=19)
# Using the boxplots.bootpls function
boxplots.bootpls(Cornell.bootYX,indices=2:8)


library(boot)
plot(Cornell.bootYX,index=2)

qqnorm(Cornell.bootYX$t[,2],ylim=c(-1,1))
abline(h=Cornell.bootYX$t0[2],lty=2)
(sum(abs(Cornell.bootYX$t[,2])>=abs(Cornell.bootYX$t0[2]))+1)/(length(Cornell.bootYX$t[,2])+1)

rm(Cornell.bootYX)
## End(No test)



