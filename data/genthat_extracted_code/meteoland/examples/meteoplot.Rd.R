library(meteoland)


### Name: meteoplot
### Title: Plots point meteorological series
### Aliases: meteoplot

### ** Examples

data(examplegridtopography)
data(exampleinterpolationdata)

#Creates spatial topography points from the grid
p = 1:2
spt = as(examplegridtopography, "SpatialPointsTopography")[p]

#Interpolation of two points for the whole time period (2000-2003)
mp = interpolationpoints(exampleinterpolationdata, spt)

#Plot interpolated meteorological series
meteoplot(mp,1, ylab="Daily mean temperature")

meteoplot(mp,1, ylab="Monthly mean temperature", fun=mean, freq="months")




