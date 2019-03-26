library(geotoolsR)


### Name: gboot_cloud
### Title: Bootstrap of the variogram cloud
### Aliases: gboot_cloud
### Keywords: Bootstrap Cloud Spatial Variogram

### ** Examples


## Not run: 
##D # Example 1
##D 
##D ## transforming the data.frame in an object of class geodata
##D data<- as.geodata(soilmoisture)
##D 
##D points(data) ## data visualization
##D 
##D var<- variog(data, max.dist = 140) ## Obtaining the variogram
##D plot(var)
##D 
##D ## Fitting the model
##D mod<- variofit(var,ini.cov.pars = c(2,80),nugget = 2,cov.model = "sph")
##D lines(mod, col=2, lwd=2) ##fitted model
##D 
##D ## Bootstrap procedure
##D 
##D boot<- gboot_cloud(data,var,mod,B=10)
##D ## For better Confidence interval, try B=1000
##D 
##D gboot_CI(boot,digits = 4) ## Bootstrap Confidence Interval
##D 
##D gboot_plot(boot) ## Bootstrap Variogram plot
##D 
##D # Example 2
##D 
##D ## transforming the data.frame in an object of class geodata
##D data<- as.geodata(NVDI)
##D 
##D points(data) ## data visualization
##D 
##D var<- variog(data, max.dist = 18) ## Obtaining the variogram
##D plot(var)
##D 
##D ## Fitting the model
##D mod<- variofit(var,ini.cov.pars = c(0.003,6),nugget = 0.003,cov.model = "gaus")
##D lines(mod, col=2, lwd=2) ##fitted model
##D 
##D ## Bootstrap procedure
##D 
##D boot<- gboot_cloud(data,var,mod,B=10)
##D ## For better Confidence interval, try B=1000
##D 
##D gboot_CI(boot,digits = 4) ## Bootstrap Confidence Interval
##D 
##D gboot_plot(boot) ## Bootstrap Variogram plot
## End(Not run)



