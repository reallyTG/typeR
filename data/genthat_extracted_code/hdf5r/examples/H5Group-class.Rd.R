library(hdf5r)


### Name: H5Group-class
### Title: Class for representing HDF5 groups
### Aliases: H5Group-class H5Group

### ** Examples

fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")
group <- file$create_group("testgroup")
group$print()
group$close()
file$close_all()



