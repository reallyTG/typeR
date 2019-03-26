library(lmmlasso)


### Name: lmmlasso
### Title: Function to fit high-dimensional (gaussian) linear mixed-effects
###   models
### Aliases: lmmlasso lmmlasso.default
### Keywords: models regression

### ** Examples

# (1) Use the lmmlasso on the classroomStudy data set
data(classroomStudy)
fit1 <-
lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,
grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
summary(fit1)
plot(fit1)

# (2) Use the lmmlasso on a small simulated data set
set.seed(54)

N <- 20           # number of groups
p <- 6            # number of covariates (including intercept)
q <- 2            # number of random effect covariates
ni <- rep(6,N)    # observations per group
ntot <- sum(ni)   # total number of observations

grp <- factor(rep(1:N,each=ni)) # grouping variable

beta <- c(1,2,4,3,0,0,0) # fixed-effects coefficients
x <- cbind(1,matrix(rnorm(ntot*p),nrow=ntot)) # design matrix

bi1 <- rep(rnorm(N,0,3),each=ni) # Psi=diag(3,2)
bi2 <- rep(rnorm(N,0,2),each=ni)
bi <- rbind(bi1,bi2)
   
z <- x[,1:2,drop=FALSE]

y <- numeric(ntot)
for (k in 1:ntot) y[k] <- x[k,]%*%beta + t(z[k,])%*%bi[,grp[k]] + rnorm(1)

# correct random effects structure
fit2 <- lmmlasso(x=x,y=y,z=z,grp=grp,lambda=10,pdMat="pdDiag")
summary(fit2)
plot(fit2)

# wrong random effects structure
fit3 <- lmmlasso(x=x,y=y,z=x[,1:3],grp=grp,lambda=10,pdMat="pdDiag")
summary(fit3)
plot(fit3)



