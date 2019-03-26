library(CAST)


### Name: CreateSpacetimeFolds
### Title: Create Space-time Folds
### Aliases: CreateSpacetimeFolds

### ** Examples

library(GSIF)
data(cookfarm)
### Prepare for 10-fold Leave-Location-and-Time-Out cross validation
indices <- CreateSpacetimeFolds(cookfarm$readings,"SOURCEID","Date")
str(indices)
### Prepare for 10-fold Leave-Location-Out cross validation
indices <- CreateSpacetimeFolds(cookfarm$readings,spacevar="SOURCEID")
str(indices)
### Prepare for leave-One-Location-Out cross validation
indices <- CreateSpacetimeFolds(cookfarm$readings,spacevar="SOURCEID",
k=length(unique(cookfarm$readings$SOURCEID)))
str(indices)



