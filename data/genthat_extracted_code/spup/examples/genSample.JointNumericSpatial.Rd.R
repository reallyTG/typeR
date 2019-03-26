library(spup)


### Name: genSample.JointNumericSpatial
### Title: Generating Monte Carlo sample from a list of uncertain objects
###   that are cross-correlated.
### Aliases: genSample.JointNumericSpatial

### ** Examples


set.seed(12345)
# "ugs" method example
# load data
data(OC, OC_sd, TN, TN_sd)

# Test for SpatialGridDataFrames
OC <- as(OC, 'SpatialGridDataFrame')
TN <- as(TN, 'SpatialGridDataFrame')
OC_sd <- as(OC_sd, 'SpatialGridDataFrame')
TN_sd <- as(TN_sd, 'SpatialGridDataFrame')

# define marginal UMs
OC_crm <- makeCRM(acf0 = 0.6, range = 5000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
TN_crm <- makeCRM(acf0 = 0.4, range = 5000, model = "Sph")
TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd), crm = TN_crm, id = "TN")

# define joint UM
soil_prop <- list(OC_UM, TN_UM)
mySpatialMUM <- defineMUM(soil_prop, matrix(c(1,0.7,0.7,1), nrow=2, ncol=2))

# sample - "ugs" method
# toy example
my_cross_sample <- genSample(mySpatialMUM, n = 3, "ugs", nmax = 24, asList = TRUE)
class(my_cross_sample)
## Not run: 
##D my_cross_sample <- genSample(mySpatialMUM, n = 50, "ugs", nmax = 24, asList = TRUE)
##D class(my_cross_sample)
## End(Not run)






