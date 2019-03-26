library(hdf5r)


### Name: H5File-class
### Title: Class for interacting with HDF5 files.
### Aliases: H5File-class H5File

### ** Examples

# The following examples generates a HDF5 file with the different HDF5 
# Objects and shows its contents:
fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")
file[["testdataset"]] <- 1:10
h5attr(file, "testattrib") <- LETTERS[1:10]
file$create_group("testgroup")
file[["testgroup/testdataset2"]] <- 1:10
# Show contents of file
file
# Close file and delete
file$close_all()

# The following example shows hdf5 file contents and how to use them to iterate over HDF5 elements:
file <- h5file(fname, mode = "a")
sapply(c("testgroup1", "testgroup2", "testgroup3"), file$create_group)
file[["testgroup1/testset1"]] <- 1:10
file[["testgroup2/testset2"]] <- 11:20
file[["testgroup3/testset3"]] <- 21:30

# Extract first 3 elements from each dataset and combine result to matrix
sapply(list.datasets(file, recursive = TRUE), function(x) file[[x]][1:3])
# Close file
file$close_all()
file.remove(fname)




