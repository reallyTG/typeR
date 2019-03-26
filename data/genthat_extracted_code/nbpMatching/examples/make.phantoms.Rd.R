library(nbpMatching)


### Name: make.phantoms
### Title: Add Phantom Rows and Columns
### Aliases: make.phantoms make.phantoms,ANY,missing-method
###   make.phantoms,data.frame,numeric-method
###   make.phantoms,matrix,numeric-method

### ** Examples


# 5x5 distance matrix
dist.mat <- matrix(c(0,5,10,15,20,5,0,15,25,35,10,15,0,25,40,15,25,25,0,15,20,35,40,15,0), nrow=5)
# add one phantom element
dm.ph <- make.phantoms(dist.mat, 1)
# create distancematrix object
distancematrix(dm.ph)
# add three phantoms
make.phantoms(dist.mat, 3)




