library(biogeo)


### Name: alternativesenv
### Title: Determine where an incorrect point record should be placed by
###   showing alternative positions for that point based on common errors
###   in datasets.
### Aliases: alternativesenv

### ** Examples

## Not run: 
##D fd<-system.file(package="biogeo")
##D foldenv<-file.path(fd,"inst","extdata", fsep = .Platform$file.sep)
##D ev<-env2stack(foldenv, vars = "", fext="bil")
##D dem<-raster(dem,xmn=-180, xmx=180, ymn=-60, ymx=90)
##D plotsetup(6,6)
##D g1="Species U"
##D vars=c("bio1","bio12")
##D d5<-alternativesenv(edat,g1,group1="Species",ev,vars,world,
##D xname="Annual Mean Temperature",yname="Annual Precipitation",
##D dem,locality="LocalityName",ext="p")
## End(Not run)



