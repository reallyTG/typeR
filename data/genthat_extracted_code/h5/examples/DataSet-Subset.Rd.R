library(h5)


### Name: DataSet-Subset
### Title: Operators to Subset DataSet Objects
### Aliases: DataSet-Subset [,DataSet,ANY,ANY-method
###   [,DataSet,missing,missing-method [,DataSet,numeric,missing-method
###   [,DataSet,missing,numeric-method [<-,DataSet,missing,missing-method
###   [<-,DataSet,numeric,missing-method [<-,DataSet,missing,numeric-method
###   [<-,DataSet,ANY,ANY-method

### ** Examples

# Write submatrix to sub-region of DataSet
testmat_n <- matrix(as.integer(1:90), ncol = 9)
file <- h5file("test.h5", "a")
file["testgroup/testmat_n2"] <- testmat_n
submat <- matrix(-1L:-9L, nrow = 3)
dset2 <- file["testgroup/testmat_n2"]
dset2[c(1, 3, 5), c(1, 3, 5)] <- submat
h5close(dset2)
h5close(file)
file.remove("test.h5")



