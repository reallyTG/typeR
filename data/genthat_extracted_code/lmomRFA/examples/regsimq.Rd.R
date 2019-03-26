library(lmomRFA)


### Name: regsimq
### Title: Compute error bounds for a fitted regional frequency
###   distribution
### Aliases: regsimq print.regsimq
### Keywords: misc

### ** Examples

data(Cascades)              # A regional data set

rmom <- regavlmom(Cascades) # Regional average L-moments

# Fit generalized normal distribution to regional data
rfit <- regfit(Cascades, "gno")

# Set up an artificial region to be simulated:
# -- Same number of sites as Cascades
# -- Same record lengths as Cascades
# -- Same site means as Cascades
# -- L-CV varies linearly across sites, with mean value equal
#    to the regional average L-CV for the Cascades data.
#    'LCVrange' specifies the  range of L-CV across the sites.
# -- L-skewness the same at each site, and equal to the regional
#    average L-skewness for the Cascades data
nsites <- nrow(Cascades)
means <- Cascades$mean
LCVrange <- 0.025
LCVs <- seq(rmom[2]-LCVrange/2, rmom[2]+LCVrange/2, len=nsites)
Lskews<-rep(rmom[3], nsites)

# Each site will have a generalized normal distribution:
# get the parameter values for each site
pp <- t(apply(cbind(means, means*LCVs ,Lskews), 1, pelgno))

# Set correlation between each pair of sites to 0.64, the
# average inter-site correlation for the Cascades data
avcor <- 0.64

# Run the simulation.  To save time, use only 100 replications.
simq <- regsimq(qfunc=quagno, para=pp, cor=avcor, nrec=Cascades$n,
  nrep=100, fit="gno")

# Relative RMSE and error bounds for the regional growth curve
simq$relbounds.rgc

# Relative RMSE and error bounds for quantiles at site 3
simq$relbounds.by.site[[3]]



