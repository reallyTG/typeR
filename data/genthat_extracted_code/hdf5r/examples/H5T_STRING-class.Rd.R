library(hdf5r)


### Name: H5T_STRING-class
### Title: Class for HDF5 string datatypes.
### Aliases: H5T_STRING-class H5T_STRING

### ** Examples

# fixed width string
str_flen <- H5T_STRING$new(size=100)
str_flen$is_vlen()
str_flen

# variable length string
str_vlen <- H5T_STRING$new(size=Inf)
str_vlen$is_vlen()
str_vlen



