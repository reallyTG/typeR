library(hdf5r)


### Name: H5P-class
### Title: Class for HDF5 property lists.
### Aliases: H5P-class H5P

### ** Examples

fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")
file[["testdataset"]] <- 1:10
p <- file[["testdataset"]]$get_create_plist()
p$get_class()
p$get_class_name()
p$copy()
p$equal(p)
file$close_all()



