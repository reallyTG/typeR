library(OceanView)


### Name: Profile data set
### Title: Temperature profiles made along a ship track.
### Aliases: TrackProf
### Keywords: datasets

### ** Examples

# save plotting parameters
 pm <- par(mfrow = c(2, 2))
 mar <- par("mar")
   
## =============================================================================
## show the metadata
## =============================================================================
 print(TrackProf$meta)

## =============================================================================
## display the cruisetrack on the Ocean Bathymetry data  
## =============================================================================  
 # 1. plots the ocean's bathymetry and add sampling positions
 ImageOcean(xlim = c(-50, 50), ylim = c(-50, 50), 
            main = "cruise track")  
 points(TrackProf$meta$longitude, TrackProf$meta$latitude, pch = "+")

# mark starting point
 points(TrackProf$meta$longitude[1], TrackProf$meta$latitude[1], 
        pch = 18, cex = 2, col = "purple")

## =============================================================================    
## image plots of raw data
## =============================================================================    

 image2D(z = TrackProf$depth, main = "raw depth values",  
       xlab = "station nr", ylab = "sample nr", clab = "depth")
 image2D(z = TrackProf$temp, main = "raw temperature values",  
       xlab = "station nr", ylab = "sample nr", clab = "dgC")

## =============================================================================    
## image plots of temperatures at correct depth
## =============================================================================    
  
# water depths to which data set is interpolated
 depth <- 0 : 809    

# map from "sigma" to "depth" coordinates
 Temp_Depth <- mapsigma (TrackProf$temp, sigma = TrackProf$depth, 
   depth = depth)$var

# image with depth increasing downward and increased resolution (resfac)  
 image2D(z = Temp_Depth, main = "Temperature-depth",
       ylim = c(809, 0), y = depth, NAcol ="black", resfac = 2, 
       xlab = "station nr", ylab = "depth, m", clab = "dgC")
   
## =============================================================================    
## scatterplot of surface values on ocean bathymetry
## =============================================================================    

 par(mar = mar + c(0, 0, 0, 2))
 par(mfrow = c(1, 1))
  
# No colors, but add contours
 ImageOcean(xlim = c(-30, 30), ylim = c(-40, 40), 
          main = "cruise track", col = "white", contour = TRUE) 
  
# use data set TrackProf to add measured temperature, with color key
 with (TrackProf, 
   scatter2D(colvar = temp[,1], x = meta[ ,"longitude"],
         y = meta[ ,"latitude"], clab = "temp", 
         add = TRUE, pch = 18, cex = 2))
  
# reset plotting parameters
 par(mar = mar)
 par(mfrow = pm)



