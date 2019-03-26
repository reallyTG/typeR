library(frambgrowth)


### Name: Sunflowers_growth
### Title: Generate size distribution of sunflower pyrite based on
###   different growth mechanisms
### Aliases: Sunflowers_growth

### ** Examples

## Size dependent and surface-controlled growth of 100 framboids adding nanocrystals
## until the mean of the diameters of framboids was 10 micrometers followed by size dependent
## and supply-controlled growth until the mean of the diameter was 15 micrometers followed by
## supply-controlled, increasing volume and size dependent growth of sunflowers
## until the mean of the diameter was 20 micrometers
library(frambgrowth)
Framboids<-Framboids_growth(100,Initialization=TRUE, Simulation=1,
Iterations=1000, MaxMeanDiameter=10)
Framboids2<-Framboids_growth(100,Initialization=FALSE, framboids=Framboids, Simulation=5,
Iterations=1000, MaxMeanDiameter=15)
Sunflowers<-Sunflowers_growth(100,Initialization=TRUE, framboids=Framboids2, Simulation=5,
Iterations=1000, MaxMeanDiameter=20)



