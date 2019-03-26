library(CDM)


### Name: data.pisa00R
### Title: PISA 2000 Reading Study (Chen & de la Torre, 2014)
### Aliases: data.pisa00R.ct data.pisa00R.cc
### Keywords: datasets

### ** Examples

#############################################################################
# EXAMPLE 1: PISA items from Chen and de la Torre (2014)
#            dichotomize item responses
#############################################################################

data(data.pisa00R.ct, package="CDM")
dat <- data.pisa00R.ct$data
Q <- data.pisa00R.ct$q.matrix
resp <- dat[, rownames(Q)]

#** extract item-wise maximum
maxK <- apply( resp, 2, max, na.rm=TRUE )
#** dichotomize response data
resp1 <- resp
for (ii in seq(1,ncol(resp)) ){
    resp1[,ii] <- 1 * ( resp[,ii]==maxK[ii] )
}



