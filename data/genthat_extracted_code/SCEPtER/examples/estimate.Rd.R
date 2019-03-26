library(SCEPtER)


### Name: estimate
### Title: Mass, radius, and age estimates for the supplied objects
### Aliases: estimate
### Keywords: manip

### ** Examples

# Solar seismic data from  Thiery et al. (2000) 
Dnisun <- 134.8
nimaxsun <- 3034

# Observational data for alpha Cent B from:
# Kjeldsen et al. (2005), Porto de Mello et al. (2008)
# Observed mass and radius: 0.935 +- 0.006, 0.863 +- 0.005
# from Miglio & Montalban (2005) 
acenB <- c(5316, 0, 0.25, 161.5/Dnisun, 4100/nimaxsun, 0.935, 0.863)
sigmaCen <- c(30, 0, 0.04, 0.01, 0.05, 0.006/0.935, 0.005/0.863)

# Load the standard estimation grid
data(stdGrid)

# order standard grid by effective temperature (required by estimate)
ii <- do.call(order, as.data.frame(stdGrid[,1]))
oGrid <- stdGrid[ii, ]

# For accurate estimates adopt at least NUM=10000
NUM <- 200
# obtain NUM copies of the object and add Gaussian perturbations
star <- matrix(acenB, byrow=TRUE, nrow=NUM, ncol=7)
starp <- errorObs(sigmaCen, star)

# select the observational constraints
# using Teff, [Fe/H], Delta nu, nu_max 
vsel <- c(1,0,1,1,1,0,0)

# call the estimation routines
res <- estimate(oGrid, starp, sigmaCen, 3, vsel)

quantile(res$M, c(0.16, 0.5, 0.84))
quantile(res$R, c(0.16, 0.5, 0.84))




