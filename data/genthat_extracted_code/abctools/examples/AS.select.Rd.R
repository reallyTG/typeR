library(abctools)


### Name: AS.select
### Title: Summary statistics selection using approximate sufficiency.
### Aliases: AS.select
### Keywords: methods

### ** Examples


# load example data:

data(coal)
data(coalobs)

param<-coal[,2]
simstats<-coal[,4:6]

# use matrix below just in case to preserve dimensions.

obsstats<-matrix(coalobs[1,4:6],nrow=1)

# example of AS.select:

## Not run: 
##D tmp <-AS.select(obsstats, param, simstats, tol=.1, method="neuralnet",
##D nument=5, allow.none=FALSE, inturn=TRUE)
##D 
##D tmp$best
## End(Not run)




