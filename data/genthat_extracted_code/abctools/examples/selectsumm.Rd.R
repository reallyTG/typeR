library(abctools)


### Name: selectsumm
### Title: Generic function for selecting summary statistics in ABC
###   inference.
### Aliases: selectsumm
### Keywords: methods

### ** Examples


# load example data:

data(coal)
data(coalobs)

param<-coal[,2]
simstats<-coal[,4:6]

# use matrix below just in case to preserve dimensions.

obsstats<-matrix(coalobs[1,4:6],nrow=1)

tmp<-selectsumm(obsstats, param, simstats, ssmethod =AS.select, tol =.1,
method = "rejection", allow.none = FALSE, inturn = TRUE, hcorr = TRUE)

tmp$best




