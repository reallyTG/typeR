library(spup)


### Name: genSample
### Title: Methods for generating Monte Carlo realizations from uncertain
###   inputs.
### Aliases: genSample

### ** Examples


set.seed(12345)

### ------------------- "MarginalNumericSpatial" -------------------
# load data
data(dem30m, dem30m_sd)

# "ugs" method example
dem_crm <- makeCRM(acf0 = 0.78, range = 321, model = "Exp")
demUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
                   
# toy example
dem_sample <- genSample(UMobject = demUM, n = 2, samplemethod = "ugs", nmax = 4, asList = FALSE)
str(dem_sample)
# any meaningful Monte Carlo analysis should have normally much larger number of runs               
## Not run: 
##D dem_sample <- genSample(UMobject = demUM, n = 100, samplemethod = "ugs", nmax = 20, asList = FALSE)
##D str(dem_sample)
## End(Not run)

# "startifiedSampling" method example
demUM <- defineUM(uncertain = TRUE, distribution = "norm", distr_param = c(dem30m, dem30m_sd))
# toy example
dem_sample <- genSample(UMobject = demUM, n = 5, samplemethod = "stratifiedSampling", p = 0:5/5)
# any meaningful Monte Carlo analysis should have normally much larger number of runs
## Not run: 
##D dem_sample <- genSample(UMobject = demUM, n = 100, samplemethod = "stratifiedSampling", p = 0:5/5)
##D str(dem_sample)
## End(Not run)

# Examples with rasters
# (raster with auto-correlation)
data(OC, OC_sd)
OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
class(OC_UM)
# toy example
some_sample <- genSample(OC_UM, n = 2, "ugs", nmax = 4)
some_sample
# any meaningful Monte Carlo analysis should have normally much larger number of runs
## Not run: 
##D some_sample <- genSample(OC_UM, n = 50, "ugs", nmax = 24)
##D some_sample
## End(Not run)


### ----------------------- "MarginalScalar" -----------------------
# example with normal distribution
scalarUM <- defineUM(uncertain = TRUE, distribution = "norm", distr_param = c(10, 1))
scalar_sample <- genSample(scalarUM, n = 10, samplemethod = "randomSampling")


### ----------------- "MarginalCategoricalSpatial" -----------------
# load data
data(woon)
woonUM <- defineUM(TRUE, categories = c(1,2,3), cat_prob = woon[, c(4:6)])
woon_sample <- genSample(woonUM, 10, asList = FALSE)
class(woon_sample)
str(woon_sample@data)


### -------------------- "JointNumericSpatial" ----------------------
# load data
data(OC, OC_sd, TN, TN_sd)

# define marginal UMs
OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
TN_crm <- makeCRM(acf0 = 0.4, range = 1000, model = "Sph")
TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd), crm = TN_crm, id = "TN")

# define joint UM
soil_prop <- list(OC_UM, TN_UM)
mySpatialMUM <- defineMUM(soil_prop, matrix(c(1,0.7,0.7,1), nrow=2, ncol=2))
class(mySpatialMUM)

# sample - "ugs" method
# toy example
my_cross_sample <- genSample(mySpatialMUM, n = 2, "ugs", nmax = 4, asList = TRUE)
class(my_cross_sample)
# any meaningful Monte Carlo analysis should have normally much larger number of runs
## Not run: 
##D my_cross_sample <- genSample(mySpatialMUM, n = 100, "ugs", nmax = 24, asList = TRUE)
##D class(my_cross_sample)
## End(Not run)


### ------------------------- "JointScalar" ------------------------
scalarUM <- defineUM(uncertain = TRUE, distribution = "norm",
                     distr_param = c(1, 2), id="Var1")                
scalarUM2 <- defineUM(uncertain = TRUE, distribution = "norm",
                      distr_param = c(3, 2), id="Var2")
scalarUM3 <- defineUM(uncertain = TRUE, distribution = "norm",
                      distr_param = c(10, 2.5), id="Var3")                
myMUM <- defineMUM(UMlist = list(scalarUM, scalarUM2, scalarUM3), 
               matrix(c(1,0.7,0.2,0.7,1,0.5,0.2,0.5,1), nrow = 3, ncol = 3))
my_sample <- genSample(myMUM, n = 5, samplemethod = "randomSampling", asList = FALSE)
my_sample  






