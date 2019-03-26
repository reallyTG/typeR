library(abctools)


### Name: stage2
### Title: stage2
### Aliases: stage2
### Keywords: methods

### ** Examples


# load example data:

data(coal)
data(coalobs)

param<-coal[,2]
simstats<-coal[,5:8]

# use matrix below just in case to preserve dimensions.

obsstats<-matrix(coalobs[1,5:8],nrow=1)
obsparam<-matrix(coalobs[1,1])

## Not run: 
##D tmp<-stage2(obsstats, param, simstats, init.bes=c(1,3), dsets = 10) 
##D tmp$best
## End(Not run)



