library(spup)


### Name: mean_MC_sgdf
### Title: mean() function for MC sample saved in a SpatialGridDataFrame
### Aliases: mean_MC_sgdf

### ** Examples


set.seed(12345)
# load data
data(dem30m, dem30m_sd)
dem_crm <- makeCRM(acf0 = 0.78, range = 321, model = "Exp")
demUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
dem_sample <- genSample(UMobject = demUM, n = 50, samplemethod = "ugs", 
                        nmax = 20, asList = FALSE)
dem_mean <- mean_MC_sgdf(dem_sample)




