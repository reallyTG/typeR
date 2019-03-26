library(hdf5r)


### Name: H5R-class
### Title: Class for HDF5 Reference datatypes.
### Aliases: H5R-class H5R

### ** Examples

fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")
file[["testset"]] <- matrix(rnorm(9), nrow = 3)
dset <- file[["testset"]]
r <- file$create_reference("testset")
file$close_all()



