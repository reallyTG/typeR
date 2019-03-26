library(spacom)


### Name: SpawExact
### Title: Create and describe spatially weighted precise contextual
###   indicators
### Aliases: SpawExact
### Keywords: spatial

### ** Examples

## Creating spatially weighted precise contextual indicator - spatially weighted 
## ethnic homogeneity across TRACES areas.
## This is step-2 function

## Step 1: Load distance matrix and create weights

data(d_geo)
geow.50 <- WeightMatrix(d_geo, bandwidth=50)

## Step 2: Load dataframe with precise contextual indicator and 
## create spatially weighted indicator

data(homog_census)

homog.g50 <- SpawExact(precise.data=homog_census,
                       context.id="area.name",
                       contextual.names="Homog_00",
                       contextual.weight.matrices=geow.50)



