library(hdf5r)


### Name: H5T-class
### Title: Class for HDF5 datatypes.
### Aliases: H5T-class H5T

### ** Examples

my_int <- h5types$H5T_NATIVE_INT
my_int$to_text()
my_int$get_size()

# Show how to commit a datatype
fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")
my_int$is_committed()
file$commit("my_int", my_int)
my_int$is_committed()

# can now also add attributes
h5attr(my_int, "test") <- "A string"
h5attributes(my_int)

file$close_all()
file.remove(fname)



