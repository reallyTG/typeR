library(hypervolume)


### Name: hypervolume_project
### Title: Geographical projection of hypervolume for species distribution
###   modeling, using the hypervolume as the environmental niche model.
### Aliases: hypervolume_project

### ** Examples

# example does not run to meet CRAN runtime guidelines - set TRUE to run
hypervolume_project_demo = FALSE
if (hypervolume_project_demo==TRUE)
{
  # load in lat/lon data
  data('quercus') 
  data_alba = subset(quercus, Species=="Quercus alba")[,c("Longitude","Latitude")]
  data_alba = data_alba[sample(1:nrow(data_alba),500),]
   
  # get worldclim data from internet
  require(maps)
  require(raster)
  climatelayers = getData('worldclim', var='bio', res=10, path=tempdir())
    
  # z-transform climate layers to make axes comparable
  climatelayers_ss = climatelayers[[c(1,12)]]
  for (i in 1:nlayers(climatelayers_ss))
  {
    climatelayers_ss[[i]] <- 
    	(climatelayers_ss[[i]] - cellStats(climatelayers_ss[[i]], 'mean')) / 
    	cellStats(climatelayers_ss[[i]], 'sd') 
  }
  climatelayers_ss = crop(climatelayers_ss, extent(-150,-50,15,60))
  
  # extract transformed climate values
  climate_alba = extract(climatelayers_ss, data_alba[1:300,])
  
  # compute hypervolume
  hv_alba <- hypervolume_gaussian(climate_alba)
  
  # do geographical projection
  raster_alba_projected_accurate <- hypervolume_project(hv_alba, 
                                      rasters=climatelayers_ss)
  raster_alba_projected_fast = hypervolume_project(hv_alba, 
                                      rasters=climatelayers_ss, 
                                      type='inclusion',
                                      fast.or.accurate='fast')
  
  # draw map of suitability scores
  plot(raster_alba_projected_accurate,xlim=c(-100,-60),ylim=c(25,55))
  map('usa',add=TRUE)
  
  plot(raster_alba_projected_fast,xlim=c(-100,-60),ylim=c(25,55))
  map('usa',add=TRUE)
}



