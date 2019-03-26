library(frambgrowth)


### Name: Framboids_growth
### Title: Generate size distribution of framboidal pyrite based on
###   different growth mechanisms
### Aliases: Framboids_growth

### ** Examples

## Size dependent and surface-controlled growth of 1000 framboids adding nanocrystals
## until the mean of the diameters of framboids was 15 micrometers.
library(frambgrowth)
Framboids<-Framboids_growth(100,Initialization=TRUE, Simulation=1,
Iterations=1000, MaxMeanDiameter=15)
## Size dependent and surface-controlled growth of 1000 framboids adding nanocrystals
## until the mean of the diameters of framboids was 10 micrometers,
## followed by size dependent and supply-controlled growth until the mean was 15 micrometers.
Framboids<-Framboids_growth(100,Initialization=TRUE, Simulation=1,
Iterations=1000, MaxMeanDiameter=10)
Framboids<-Framboids_growth(100,Initialization=FALSE, Simulation=5, framboids=Framboids,
Iterations=1000, MaxMeanDiameter=15)



