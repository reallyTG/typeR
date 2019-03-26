library(rLiDAR)


### Name: ForestCAS
### Title: Individual trees crown deliniation from LiDAR-derived Canopy
###   Height Model (CHM)
### Aliases: ForestCAS

### ** Examples

## Not run: 
##D 
##D # Import the LiDAR-derived CHM file
##D data(chm) # or set a CHM. e.g. chm<-raster("CHM_stand.asc") 
##D 
##D # Set the loc parameter
##D sCHM<-CHMsmoothing(chm, filter="mean", ws=5) # smoothing CHM
##D loc<-FindTreesCHM(sCHM, fws=5, minht=8)      # or import a tree list
##D 
##D # Set the maxcrown parameter
##D maxcrown=10.0 
##D 
##D # Set the exclusion parameter
##D exclusion=0.3 # 30
##D 
##D # Compute individual tree detection canopy area
##D canopy<-ForestCAS(chm, loc, maxcrown, exclusion)
##D 
##D #==================================================================================#
##D # Retrieving the boundary for individual tree detection and canopy area calculation
##D #==================================================================================#
##D boundaryTrees<-canopy[[1]]
##D # Plotting the individual tree canopy boundary over the CHM
##D plot(chm, main="LiDAR-derived CHM") 
##D plot(boundaryTrees, add=T, border='red', bg='transparent') # adding tree canopy boundary
##D 
##D #============================================================================#
##D # Retrieving the list of individual trees detected for canopy area calculation
##D #============================================================================#
##D canopyList<-canopy[[2]] # list of ground-projected areas of individual tree canopies
##D summary(canopyList)     # summary 
##D 
##D # Spatial location of the trees
##D library(sp)
##D XY<-SpatialPoints(canopyList[,1:2])    # Spatial points
##D plot(XY, col="black", add=T, pch="*")  # adding tree location to the plot
## End(Not run) 



