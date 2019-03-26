library(hdf5r)


### Name: H5A-class
### Title: Class for representing HDF5 attributes
### Aliases: H5A-class H5A

### ** Examples

fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")
h5attr(file, "attr_numeric") <- rnorm(10)
a <- file$attr_open("attr_numeric")
a$get_info()
a$attr_name()
a$get_space()
a$get_type()
a$get_storage_size()
a$read()
a$write(10:1)
a$print()
a$close()
file$close_all()



