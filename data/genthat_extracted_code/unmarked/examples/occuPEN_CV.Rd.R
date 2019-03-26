library(unmarked)


### Name: occuPEN_CV
### Title: Fit the MacKenzie et al. (2002) Occupancy Model with the
###   penalized likelihood methods of Hutchinson et al. (2015) using
###   cross-validation
### Aliases: occuPEN_CV
### Keywords: models

### ** Examples


# Simulate occupancy data
set.seed(646)
nSites <- 60
nReps <- 2
covariates <- data.frame(veght=rnorm(nSites),
    habitat=factor(c(rep('A', 30), rep('B', 30))))

psipars <- c(-1, 1, -1)
ppars <- c(1, -1, 0)
X <- model.matrix(~veght+habitat, covariates) # design matrix
psi <- plogis(X %*% psipars)
p <- plogis(X %*% ppars)

y <- matrix(NA, nSites, nReps)
z <- rbinom(nSites, 1, psi)       # true occupancy state
for(i in 1:nSites) {
    y[i,] <- rbinom(nReps, 1, z[i]*p[i])
    }

# Organize data and look at it
umf <- unmarkedFrameOccu(y = y, siteCovs = covariates)
obsCovs(umf) <- covariates
head(umf)
summary(umf)

## Not run: 
##D 
##D # Fit some models
##D fmMLE <- occu(~veght+habitat ~veght+habitat, umf)
##D fmMLE@estimates
##D 
##D fm1penCV <- occuPEN_CV(~veght+habitat ~veght+habitat,
##D  umf,pen.type="Ridge", foldAssignments=rep(1:5,ceiling(nSites/5))[1:nSites])
##D fm1penCV@lambdaVec
##D fm1penCV@chosenLambda
##D fm1penCV@estimates
##D 
##D fm2penCV <- occuPEN_CV(~veght+habitat ~veght+habitat,
##D umf,pen.type="Bayes",foldAssignments=rep(1:5,ceiling(nSites/5))[1:nSites])
##D fm2penCV@lambdaVec
##D fm2penCV@chosenLambda
##D fm2penCV@estimates
##D 
##D # nonparametric bootstrap for uncertainty analysis:
##D # bootstrap is wrapped around the cross-validation
##D fm2penCV <- nonparboot(fm2penCV,B=10) # should use more samples
##D vcov(fm2penCV,method="nonparboot")
##D 
##D # Mean squared error of parameters:
##D mean((c(psipars,ppars)-c(fmMLE[1]@estimates,fmMLE[2]@estimates))^2)
##D mean((c(psipars,ppars)-c(fm1penCV[1]@estimates,fm1penCV[2]@estimates))^2)
##D mean((c(psipars,ppars)-c(fm2penCV[1]@estimates,fm2penCV[2]@estimates))^2)
## End(Not run)





