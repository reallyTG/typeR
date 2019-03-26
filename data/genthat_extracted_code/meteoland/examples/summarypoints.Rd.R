library(meteoland)


### Name: summarypoints
### Title: Summaries of meteorological data
### Aliases: summarypoints summarygrid summarypixels
###   summaryinterpolationdata

### ** Examples

data(examplegridtopography)
data(exampleinterpolationdata)

#Creates spatial topography points from the grid
p = 1:2
spt = as(examplegridtopography, "SpatialPointsTopography")[p]

#Interpolation of two points for the whole time period (2000-2003)
mp = interpolationpoints(exampleinterpolationdata, spt)

#PET sums by months
mp.sum = summarypoints(mp, var="PET", freq="months")

mp.sum



