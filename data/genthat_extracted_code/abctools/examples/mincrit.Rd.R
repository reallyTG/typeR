library(abctools)


### Name: mincrit
### Title: Summary statistics selection by minimizing a posterior sample
###   measure.
### Aliases: mincrit
### Keywords: methods

### ** Examples


# load example data:

data(coal)
data(coalobs)

param<-coal[,2]
simstats<-coal[,4:6]

# use matrix below just in case to preserve dimensions.

obsstats<-matrix(coalobs[1,4:6],nrow=1)
obsparam<-matrix(coalobs[1,1])

# example of entropy minimization algorithm:

tmp <-mincrit(obsstats, param, simstats, tol=.01, method="rejection", 
do.crit=TRUE)

tmp$critvals




