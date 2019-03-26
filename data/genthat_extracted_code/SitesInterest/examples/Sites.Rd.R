library(SitesInterest)


### Name: Sites
### Title: Finds the number of sites of interest from already calculated
###   residence times
### Aliases: Sites

### ** Examples

## No test: 
##Find the current working directory
wd = getwd()
##Set the working directory as the temporary one
setwd(tempdir())
##Set the working directory as the temporary one
setwd(tempdir())
##Load the data
data(OU_14)
t=unlist(OU_14["t"])
X=unlist(OU_14["X"])
Y=unlist(OU_14["Y"])

##Calculate the residence time with a radius of 0.3 and not including the first circle
Alt_Alg("OU_14",t,X,Y,0.3,first='y',save='y')

##Calculate all the necessary information to be used elsewhere
Sites("OU_14",0.3,first='y')

##Reset the original working directory
setwd(wd)
## End(No test)



