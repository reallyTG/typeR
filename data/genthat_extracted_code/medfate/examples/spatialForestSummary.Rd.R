library(medfate)


### Name: spatialForestSummary
### Title: Forest and soil summaries over space
### Aliases: spatialForestSummary spatialSoilSummary
###   spatialForestSummary-methods spatialSoilSummary-methods
###   spatialForestSummary,SpatialPointsLandscape-method
###   spatialForestSummary,SpatialPixelsLandscape-method
###   spatialForestSummary,SpatialGridLandscape-method
###   spatialSoilSummary,SpatialPointsLandscape-method
###   spatialSoilSummary,SpatialPixelsLandscape-method
###   spatialSoilSummary,SpatialGridLandscape-method

### ** Examples

#Load plot data
data(exampleSPL)

#Load species parameters
data(SpParamsMED)

#Apply summary function
y <- spatialForestSummary(exampleSPL,summary.forest, SpParamsMED)
head(y@data)

#Plot basal area
spplot(y["BA"])




