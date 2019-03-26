library(h5)


### Name: H5File
### Title: HDF5 File Objects
### Aliases: H5File H5File-class h5file h5flush h5flush,H5File-method
###   h5close,H5File-method is.h5file

### ** Examples

# The following examples generates a HDF5 file with the different HDF5 
# Objects and shows its contents:
file <- h5file(name = "test1.h5", mode = "a")
file["testdataset"] <- 1:10
h5attr(file, "testattrib") <- LETTERS[1:10]
file["testgroup/testdataset2"] <- 1:10
file
# Close file and delete
h5close(file)
if(file.exists("test.h5")) file.remove("test.h5")

# The following example shows hdf5 file contents and how to use them to iterate over HDF5 elements:
file <- h5file(name = "test2.h5", mode = "a")
file["testgroup1/testset1"] <- 1:10
file["testgroup2/testset2"] <- 11:20
file["testgroup3/testset3"] <- 21:30

# Extract first 3 elements from each dataset and combine result to matrix
sapply(list.datasets(file, recursive = TRUE), function(x) file[x][1:3])
# Add new dataset to each group in HDF5 file
for(g in list.groups(file)) {
  file[paste(g, "testsetx", collapse = "/")] <- 1:10
}
list.datasets(file, recursive = TRUE)
# Close file
h5close(file)



