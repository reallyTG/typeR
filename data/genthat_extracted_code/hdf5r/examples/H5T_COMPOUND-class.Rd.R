library(hdf5r)


### Name: H5T_COMPOUND-class
### Title: Class for HDF5 compound datatypes.
### Aliases: H5T_COMPOUND-class H5T_COMPOUND

### ** Examples

# create a H5T_COMPOUND  corresponding to a data-frame
my_cpd <- H5T_COMPOUND$new(c("name", "age", "salary"),
    dtypes=list(H5T_STRING$new(size=200), h5types$H5T_NATIVE_INT, h5types$H5T_NATIVE_DOUBLE))
my_cpd



