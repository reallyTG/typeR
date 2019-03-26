library(vegclust)


### Name: stratifyvegdata
### Title: Reshapes community data from individual into stratified form
### Aliases: stratifyvegdata as.stratifiedvegdata

### ** Examples

## Load tree data
data(treedata)

## Inspect tree data
head(treedata)

## Define stratum thresholds (4 strata)
heights = seq(0,4, by=0.5)
diameters = seq(0,2, by=0.5)

## Stratify tree data using heights as structural variable
X = stratifyvegdata(treedata, sizes1=heights, plotColumn="plotID",
                    speciesColumn="species", size1Column="height", counts=TRUE)

## Inspect the second plot record
X[[2]]

## Stratify tree data using heights as structural variable and cover as abundance
Y = stratifyvegdata(treedata, sizes1=heights, plotColumn="plotID",
                    speciesColumn="species", size1Column="height", 
                    abundanceColumn="cover")
Y[[2]]

## Stratify tree data using heights and diameters as structural variables
Z = stratifyvegdata(treedata, sizes1=heights, sizes2=diameters, plotColumn="plotID",
                    speciesColumn="species", size1Column="height", size2Column="diam",
                    counts=TRUE)
Z[[2]]






