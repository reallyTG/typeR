library(spup)


### Name: sd_MC_sgdf
### Title: sd() function for MC sample saved in a SpatialGridDataFrame
### Aliases: sd_MC_sgdf

### ** Examples


set.seed(12345)
data(dem30m, dem30m_sd)
dem_crm <- makeCRM(acf0 = 0.78, range = 321, model = "Exp")
demUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
## Not run: 
##D dem_sample <- genSample(UMobject = demUM, n = 50, samplemethod = "ugs",
##D                         nmax = 20, asList = FALSE)
##D dem_sample_sd <- sd_MC_sgdf(dem_sample)
## End(Not run)




