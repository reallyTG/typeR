library(pan)


### Name: pan
### Title: Imputation of multivariate panel or cluster data
### Aliases: pan
### Keywords: models

### ** Examples

########################################################################
# This example is somewhat atypical because the data consist of a
# single response variable (change in heart rate) measured repeatedly;
# most uses of pan() will involve r > 1 response variables. If we had
# r response variables rather than one, the only difference would be
# that the vector y below would become a matrix with r columns, one
# for each response variable. The dimensions of Sigma (the residual
# covariance matrix for the response) and Psi (the covariance matrix
# for the random effects) would also change to (r x r) and (r*q x r*q),
# respectively, where q is the number of random coefficients in the
# model (in this case q=1 because we have only random intercepts). The
# new dimensions for Sigma and Psi will be reflected in the prior
# distribution, as Dinv and Binv become (r x r) and (r*q x r*q).  
#
# The pred matrix has the same number of rows as y, the number of
# subject-occasions. Each column of Xi and Zi must be represented in
# pred. Because Zi is merely the first column of Xi, we do not need to
# enter that column twice. So pred is simply the matrix Xi, stacked
# upon itself nine times.
#
data(marijuana)
attach(marijuana)
pred <- with(marijuana,cbind(int,dummy1,dummy2,dummy3,dummy4,dummy5))
#
# Now we must tell pan that all six columns of pred are to be used in
# Xi, but only the first column of pred appears in Zi.
#
xcol <- 1:6
zcol <- 1
########################################################################
# The model specification is now complete. The only task that remains
# is to specify the prior distributions for the covariance matrices
# Sigma and Psi.
#
# Recall that the dimension of Sigma is (r x r) where r
# is the number of response variables (in this case, r=1). The prior
# distribution for Sigma is inverted Wishart with hyperparameters a 
# (scalar) and Binv (r x r), where a is the imaginary degrees of freedom
# and Binv/a is the prior guesstimate of Sigma. The value of a must be
# greater than or equal to r. The "least informative" prior possible
# would have a=r, so here we will take a=1. As a prior guesstimate of 
# Sigma we will use the (r x r) identity matrix, so Binv = 1*1 = 1.
#
# By similar reasoning we choose the prior distribution for Psi. The
# dimension of Psi is (r*q x r*q) where q is the number of random
# effects in the model (i.e. the length of zcol, which in this case is
# one). The hyperparameters for Psi are c and Dinv, where c is the
# imaginary degrees of freedom (which must be greater than or equal to
# r*q) and Dinv/c is the prior guesstimate of Psi. We will take c=1
# and Dinv=1*1 = 1.
#
# The prior is specified as a list with four components named a, Binv,
# c, and Dinv, respectively.
#
prior <- list(a=1,Binv=1,c=1,Dinv=1)
########################################################################
# Now we are ready to run pan(). Let's assume that the pan function
# and the object code have already been loaded into R. First we
# do a preliminary run of 1000 iterations. 
#
result <- pan(y,subj,pred,xcol,zcol,prior,seed=13579,iter=1000)
#
# Check the convergence behavior by making time-series plots and acfs
# for the model parameters. Variances will be plotted on a log
# scale. We'll assume that a graphics device has already been opened.
#
plot(1:1000,log(result$sigma[1,1,]),type="l")
acf(log(result$sigma[1,1,]))
plot(1:1000,log(result$psi[1,1,]),type="l")
acf(log(result$psi[1,1,]))
par(mfrow=c(3,2))
for(i in 1:6) plot(1:1000,result$beta[i,1,],type="l")
for(i in 1:6) acf(result$beta[i,1,])
#
# This example appears to converge very rapidly; the only appreciable
# autocorrelations are found in Psi, and even those die down by lag
# 10. With a sample this small we can afford to be cautious, so let's
# impute the missing data m=10 times taking 100 steps between
# imputations. We'll use the current simulated value of y as the first
# imputation, then restart the chain where we left off to produce
# the second through the tenth.
#
y1 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=9565,iter=100,start=result$last)
y2 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=6047,iter=100,start=result$last)
y3 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=3955,iter=100,start=result$last)
y4 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=4761,iter=100,start=result$last)
y5 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=9188,iter=100,start=result$last)
y6 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=9029,iter=100,start=result$last)
y7 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=4343,iter=100,start=result$last)
y8 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=2372,iter=100,start=result$last)
y9 <- result$y
result <- pan(y,subj,pred,xcol,zcol,prior,seed=7081,iter=100,start=result$last)
y10 <- result$y
########################################################################
# Now we combine the imputation results according to mitools
########################################################################
# First, we build data frames from above,
d1 <- data.frame(y=y1,subj,pred)
d2 <- data.frame(y=y2,subj,pred)
d3 <- data.frame(y=y3,subj,pred)
d4 <- data.frame(y=y4,subj,pred)
d5 <- data.frame(y=y5,subj,pred)
d6 <- data.frame(y=y6,subj,pred)
d7 <- data.frame(y=y7,subj,pred)
d8 <- data.frame(y=y8,subj,pred)
d9 <- data.frame(y=y9,subj,pred)
d10 <- data.frame(y=y10,subj,pred)
# Second, we establish a S3 object as needed for the function MIcombine
# nevertheless we start with an ordinary least squares regression
require(mitools)
d <- imputationList(list(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10))
w <- with(d,lm(y~-1+pred))
MIcombine(w)
# Now, we can turn to lmer as in lme4 package but in this case it is the
# same.
if(require(lme4)) {
w2 <- with(d,lmer(y~-1+pred+(1|subj)))
b <- MIextract(w2,fun=fixef)
Var <- function(obj) unlist(lapply(diag(vcov(obj)),function(m) m))
v <- MIextract(w2,fun=Var)
MIcombine(b,v)
detach(marijuana)
}
### bivariate example

data(bitest)
attach(bitest)
y <- with(bitest,cbind(y1,y2))

subj <- c(clusterid)
pred <- cbind (int, x1, x2, x3)
xcol <- 1:4
zcol <- 1
a <- 2
c <- 2
id2 <- matrix(c(1,0,0,1),ncol=2,nrow=2)
Binv <- a*id2
Dinv <- c*id2
prior <- list(a=a, Binv=Binv, c=c, Dinv=Dinv)
result <- pan(y, subj, pred, xcol, zcol, prior, seed=12345, iter=1000)



