library(multimode)


### Name: locmodes
### Title: Location of modes and antimodes
### Aliases: locmodes plot.locmod print.locmod
### Keywords: mode estimation

### ** Examples

# Testing for unimodality
set.seed(2016)
data=rnorm(50)
modetest(data)
#There is no evidence to reject the null hypothesis of unimodality
#Estimated location of the mode and its density value
locmodes(data)
## Not run: 
##D #Estimated locations of the five modes in the claw of Marron and Wand (1992)
##D library(nor1mix)
##D set.seed(2016)
##D n<-200
##D data<-nor1mix::rnorMix(n,MW.nm10)
##D #Adding the plot of the estimated locations
##D locmodes(data,5,display=T)
##D #Assuming that the compact support is [-1.5,1.5]
##D locmodes(data,5,-1.5,1.5,display=T)
## End(Not run)



