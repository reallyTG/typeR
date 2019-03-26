library(unmarked)


### Name: occuPEN
### Title: Fit the MacKenzie et al. (2002) Occupancy Model with the
###   penalized likelihood methods of Hutchinson et al. (2015)
### Aliases: occuPEN
### Keywords: models

### ** Examples


# Simulate occupancy data
set.seed(344)
nSites <- 100
nReps <- 2
covariates <- data.frame(veght=rnorm(nSites),
    habitat=factor(c(rep('A', nSites/2), rep('B', nSites/2))))

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


# Fit some models
fmMLE <- occu(~veght+habitat ~veght+habitat, umf)
fm1pen <- occuPEN(~veght+habitat ~veght+habitat, umf,lambda=0.33,pen.type="Ridge")
fm2pen <- occuPEN(~veght+habitat ~veght+habitat, umf,lambda=1,pen.type="Bayes")

# MPLE:
fm3pen <- occuPEN(~veght+habitat ~veght+habitat, umf,lambda=0.5,pen.type="MPLE")
MPLElambda = computeMPLElambda(~veght+habitat ~veght+habitat, umf) 
fm4pen <- occuPEN(~veght+habitat ~veght+habitat, umf,lambda=MPLElambda,pen.type="MPLE")

# nonparametric bootstrap for uncertainty analysis:
fm1pen <- nonparboot(fm1pen,B=20) # should use more samples
vcov(fm1pen,method="nonparboot")







