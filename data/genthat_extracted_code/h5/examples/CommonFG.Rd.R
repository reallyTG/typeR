library(h5)


### Name: CommonFG
### Title: The CommonFG Class
### Aliases: CommonFG CommonFG-class h5close
###   [,CommonFG,character,ANY-method [<-,CommonFG,character,ANY-method
###   h5unlink h5unlink,CommonFG,character-method

### ** Examples

file <- h5file("test.h5")
# Create new DataSet 'testset' in H5Group 'testgroup'
file["testgroup/testset"] <- matrix(1:9, nrow = 3)
# Create new DataSet 'testset2' in file root
file["testset2"] <- 1:10
# Retrieve H5Group 'testgroup'
group <- file["testgroup"]
# Retrieve DataSet 'testset'
dset <- group["testset"]
h5close(dset)
h5close(group)
h5close(file)
file.remove("test.h5")



