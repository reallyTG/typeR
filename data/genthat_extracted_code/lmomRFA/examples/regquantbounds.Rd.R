library(lmomRFA)


### Name: regquantbounds
### Title: Compute error bounds for a regional frequency distribution
### Aliases: regquantbounds sitequantbounds
### Keywords: misc

### ** Examples

data(Cascades)              # A regional data set

rmom <- regavlmom(Cascades) # Regional average L-moments

# Fit a generalized normal distribution to the regional data
rfit <- regfit(Cascades, "gno")

# Set up an artificial region to be simulated:
# -- Same number of sites as Cascades
# -- Same record lengths as Cascades
# -- Same site means as Cascades
# -- L-CV varies linearly across sites, with mean value equal
#    to the regional average L-CV for the Cascades data.
#      'LCVrange' specifies the  range of L-CV across the sites,
#    and is chosen to reflect the amount of heterogeneity that
#    may reasonably be believed to be present in the Cascades
#    data (see the example for 'regsimh').
# -- L-skewness is the same at each site, and is equal to the
#    regional average L-skewness for the Cascades data
nsites <- nrow(Cascades)
means <- Cascades$mean
LCVrange <- 0.025
LCVs <- seq(rmom[2]-LCVrange/2, rmom[2]+LCVrange/2, len=nsites)
Lskews<-rep(rmom[3], nsites)

# Each site will have a generalized normal distribution:
# get the parameter values for each site
pp <- t(apply(cbind(means, means*LCVs ,Lskews), 1, pelgno))
pp

# Set correlation between each pair of sites to 0.64, the
# average inter-site correlation for the Cascades data
avcor <- 0.64

# Run the simulation.  To save time, use only 100 replications.
simq <- regsimq(qfunc=quagno, para=pp, cor=avcor, nrec=Cascades$n,  nrep=100, fit="gno")

# Apply the simulated bounds to the estimated regional growth curve
regquantbounds(simq, rfit)

# Apply the simulated bounds to quantiles for site 3
sitequantbounds(simq, rfit, site=3)

# Apply the simulated bounds to quantiles for a site whose mean
# is estimated to be 100 with standard error 25
sitequantbounds(simq, rfit, index=100, seindex=25)



