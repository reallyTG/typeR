library(spup)


### Name: genSample.MarginalNumericSpatial
### Title: Generating Monte Carlo sample from an uncertain object of a
###   class 'MarginalNumericSpatial'
### Aliases: genSample.MarginalNumericSpatial

### ** Examples


set.seed(12345)
# load data
data(dem30m, dem30m_sd)

# "ugs" method example
dem_crm <- makeCRM(acf0 = 0.78, range = 321, model = "Exp")
demUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
                   
# toy example
dem_sample <- genSample(UMobject = demUM, n = 2, samplemethod = "ugs", nmax = 6, asList = FALSE)
str(dem_sample)               
## Not run: 
##D dem_sample <- genSample(UMobject = demUM, n = 50, samplemethod = "ugs", nmax = 20, asList = FALSE)
##D str(dem_sample)
## End(Not run)


# "startifiedSampling" method example
demUM <- defineUM(uncertain = TRUE, distribution = "norm", distr_param = c(dem30m, dem30m_sd))
# toy example
dem_sample <- genSample(UMobject = demUM, n = 5, samplemethod = "stratifiedSampling", p = 0:5/5)
## Not run: 
##D dem_sample <- genSample(UMobject = demUM, n = 50, samplemethod = "stratifiedSampling", p = 0:5/5)
##D str(dem_sample)
## End(Not run)

# Examples with rasters
# (raster with auto-correlation)
data(OC, OC_sd)
OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
class(OC_UM)
# toy example
some_sample <- genSample(OC_UM, n = 3, "ugs", nmax=6)
some_sample
## Not run: 
##D some_sample <- genSample(OC_UM, n = 50, "ugs", nmax=20)
##D some_sample
## End(Not run)




