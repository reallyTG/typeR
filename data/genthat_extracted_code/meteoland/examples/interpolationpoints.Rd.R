library(meteoland)


### Name: interpolationpoints
### Title: Interpolates daily meteorology over a landscape
### Aliases: interpolationpoints interpolationpixels interpolationgrid

### ** Examples

data(examplegridtopography)
data(exampleinterpolationdata)

####### INTERPOLATION on particular POINTS 

#Creates spatial topography points from the grid
p = 1:2
spt = as(examplegridtopography, "SpatialPointsTopography")[p]

#Interpolation of two points for the whole time period (2000-2003)
mp = interpolationpoints(exampleinterpolationdata, spt)

#Plot interpolated meteorological series
meteoplot(mp,1, ylab="Mean temperature")

####### INTERPOLATION on PIXELS 
# Creates spatial topography pixels as a subset of grid pixels
# and select pixels at maximum distance of 2km from center
spt = as(examplegridtopography,"SpatialPointsTopography")
cc = spt@coords
center = 5160
d = sqrt((cc[,1]-cc[center,1])^2+(cc[,2]-cc[center,2])^2)
spxt = as(spt[which(d<2000)], "SpatialPixelsTopography") 

# Interpolation of meteorology over pixels for two days
ml = interpolationpixels(exampleinterpolationdata, spxt,
                       as.Date(c("2001-02-03", "2001-06-03")))
                       
#Plot PET corresponding to 2001-06-03
spplot(ml,2,"PET")

####### INTERPOLATION over a complete GRID 
#Interpolation of meteorology over a grid for two days
ml = interpolationgrid(exampleinterpolationdata, examplegridtopography,
                       as.Date(c("2001-02-03", "2001-06-03")))
#Plot PET corresponding to 2001-06-03
spplot(ml,2,"PET")



