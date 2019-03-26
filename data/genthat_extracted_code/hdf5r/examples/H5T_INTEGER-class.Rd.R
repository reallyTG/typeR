library(hdf5r)


### Name: H5T_INTEGER-class
### Title: Class for HDF5 integer-datatypes.
### Aliases: H5T_INTEGER-class H5T_INTEGER H5T_BITFIELD

### ** Examples

my_int <- h5types$H5T_NATIVE_INT

# make an int with 2 bit
my_int$set_sign(h5const$H5T_SGN_NONE)
my_int$set_size(1)
my_int$set_precision(2)
my_int$describe()



