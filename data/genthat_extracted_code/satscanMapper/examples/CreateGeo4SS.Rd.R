library(satscanMapper)


### Name: CreateGeo4SS
### Title: Function reads the population and case SaTScan (TM) input files
###   and creates a coordinates file based on the U. S. state, county, or
###   census tract FIPS code as the location IDs.
### Aliases: CreateGeo4SS

### ** Examples


######
##
##  Example # 1 - creating a coordinates file for a SaTScan (TM) analysis
##
##  This example access the population and case data files used in a 
##  SaTScan (TM) analysis:
##     a) read the files to build a list of all of the location IDs 
##          involved in the analysis, 
##     b) validates the location IDs against the U. S. Census web site's 
##          list of Location IDs for that year and geographic level 
##          (State, State/County or State/County/Census Tract), and 
##     c) returns a list of centroid X, Y coordinates for each location ID.
##
##  The coordinates file can be written to disk or returned as a data.frame 
##  to the caller as the return value of the CreateGeo4SS function.
##
##  The coordinates values returned are based on an equal-area projection 
##  of the lat and long values of the area centroids based on the 
##  area boundary data used to map the areas.
##
##  The example population and case data files distributed with the package 
##  are located in the installation directory for the satscanMapper package.
##
#
##  return a DF of the coordination data
#
## Not run: 
##D 
##D SSInstDir <- system.file(package="satscanMapper", "extdata")
##D 
##D PopFile   <- "inc_noadj_cir.pop"
##D 
##D CasFile   <- "inc_noadj_cir.cas"
##D 
##D GeoDF     <- CreateGeo4SS(path=SSInstDir, 
##D                           pop=PopFile, 
##D 
##D                           cas=CasFile, 
##D                           censusYear="2010",
##D                           header=FALSE)
##D 
##D str(GeoDF)
##D 
## End(Not run)
#  Example removed due to time constraints
#
######


#####
#
#  This example #2 creates a coordinates file.
#

## Not run: 
##D 
##D SSInstDir <- system.file(package="satscanMapper", "extdata")
##D 
##D PopFile   <- "inc_noadj_cir.pop"
##D 
##D CasFile   <- "inc_noadj_cir.cas"
##D 
##D GeoDF     <- CreateGeo4SS(path=SSInstDir, 
##D                           pop=PopFile, 
##D                           cas=CasFile, 
##D                           geo="inc_noadj_cir.geo",
##D                           censusYear="2010",
##D                           header=FALSE)
##D 
##D # output file written to the extdata directory of the package installation.
##D 
## End(Not run)

####

print(" End of CreateGeo4SS examples.")

####






