library(vegclust)


### Name: CAS
### Title: Cumulative abundance surface (CAS)
### Aliases: CAS CASmargin CAS2matrix CAScenters CASquantile

### ** Examples

## Load tree data
data(treedata)

## Define stratum thresholds (4 strata)
heights = seq(0,4, by=0.5)
diameters = seq(0,2, by=0.5)


## Stratify tree data using heights and diameters as structural variables
X = stratifyvegdata(treedata, sizes1=heights, sizes2=diameters, plotColumn="plotID",
                    speciesColumn="species", size1Column="height", size2Column="diam",
                    counts=TRUE)
X[[2]]

## Build cummulative abundance surface
Y = CAS(X)

Y[[2]]

##  Extracts the first and second marginal (i.e. CAP on heights or diameters respectively)
Y.M1 = CASmargin(Y, margin = 1)
Y.M1[[2]]

Y.M2 = CASmargin(Y, margin = 2)
Y.M2[[2]]

##  For comparison we calculate the same profiles using the stratifyvegdata and CAP functions
Y1 = CAP(stratifyvegdata(treedata, sizes1=heights, plotColumn="plotID",
                    speciesColumn="species", size1Column="height",
                    counts=TRUE))                   
Y1[[2]]
Y2 = CAP(stratifyvegdata(treedata, sizes1=diameters, plotColumn="plotID",
                    speciesColumn="species", size1Column="diam",
                    counts=TRUE))                   
Y2[[2]]

##  Compare Y.M1[[2]] with Y1[[2]] and Y.M2[[2]] with Y2[[2]]



