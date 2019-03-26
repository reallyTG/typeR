library(sos)


### Name: installPackages
### Title: install packages with minimum count
### Aliases: installPackages installPackages.findFn
###   installPackages.packageSum
### Keywords: package

### ** Examples

##
## 1.  findFn object
##
spl <- findFn("spline", maxPages = 2)
# check the code but do not install anything:
installPackages(spl, minCount=spl[1, 'Count']+1)

# default: install packages with 
# Count>=minCount
## Not run: 
##D installPackages(spl)
## End(Not run)

##
## 2.  packageSum object
##

splS <- packageSum(spl)
# check the code but do not install anything:
installPackages(splS, splS[1, 'Count']+1)

# install ALL packages
## Not run: 
##D installPackages(splS, 1)
## End(Not run)




