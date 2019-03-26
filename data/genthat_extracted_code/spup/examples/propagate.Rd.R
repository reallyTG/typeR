library(spup)


### Name: propagate
### Title: Propagation function
### Aliases: propagate

### ** Examples


set.seed(12345)
## continuous spatial data example with a single variable
# load data
data(dem30m, dem30m_sd)

# Slope model 
Slope <- function(DEM, ...) {
  require(raster)
  require(purrr)
  demraster <- 
    DEM %>%
    raster()
  demraster %>%
    terrain(opt = 'slope', ...) %>%
    as("SpatialGridDataFrame")
}
 
# uncertainty propagation
dem_crm <- makeCRM(acf0 = 0.78, range = 321, model = "Exp")
demUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
# toy example
dem_sample <- genSample(UMobject = demUM, n = 3, samplemethod = "ugs", nmax = 20)
slope_sample <- propagate(dem_sample, model = Slope, n = 3)
## Not run: 
##D dem_sample <- genSample(UMobject = demUM, n = 50, samplemethod = "ugs", nmax = 20)
##D slope_sample <- propagate(dem_sample, model = Slope, n = 50)
## End(Not run)

## categorical spatial data example
# load data
data(woon)

# tax model
tax <- function(building_Function) { 
  building_Function$tax2pay <- NA
  building_Function$tax2pay[building_Function$Function == 1] <- 1000
  building_Function$tax2pay[building_Function$Function == 2] <- 10000
  building_Function$tax2pay[building_Function$Function == 3] <- 10
  total_tax <- sum(building_Function$tax2pay)
  total_tax
}

# uncertainty propagation
woonUM <- defineUM(TRUE, categories = c(1,2,3), cat_prob = woon[, c(4:6)])
woon_sample <- genSample(woonUM, 10)
class(woon_sample)
tax # the model takes SpatialGridDataFrame with a column called "Function"
for (i in 1:10) names(woon_sample[[i]]) <- "Function"
tax_uncert <- propagate(realizations = woon_sample, n = 10, model = tax)
tax_uncert <- unlist(tax_uncert)
summary(tax_uncert)

## cross-correlated example
# load data
data(OC, OC_sd, TN, TN_sd)

# C/N model
C_N_model_raster <- function(OC, TN) {
  OC/TN
}

# define marginal UMs
OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
TN_crm <- makeCRM(acf0 = 0.4, range = 1000, model = "Sph")
TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd), crm = TN_crm, id = "TN")

# define joint UM
mySpatialMUM <- defineMUM(list(OC_UM, TN_UM), matrix(c(1,0.7,0.7,1), nrow=2, ncol=2))

# sample - "ugs" method
# toy example
my_cross_sample <- genSample(mySpatialMUM, n = 3, "ugs", nmax = 24)
class(my_cross_sample)
# run propagation
CN_sample <- propagate(realizations = my_cross_sample, model = C_N_model_raster, n = 3)
CN_sample
## Not run: 
##D my_cross_sample <- genSample(mySpatialMUM, 50, "ugs", nmax = 24)
##D class(my_cross_sample)
##D # run propagation
##D CN_sample <- propagate(realizations = my_cross_sample, model = C_N_model_raster, n = 50)
##D CN_sample
## End(Not run)




