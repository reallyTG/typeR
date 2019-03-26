library(hdf5r)


### Name: H5T_ENUM-class
### Title: Class for HDF5 enumeration datatypes.
### Aliases: H5T_ENUM-class H5T_ENUM

### ** Examples

nucleotide_enum <- H5T_ENUM$new(labels=c("A", "C", "G", "T"), values=0:3)
nucleotide_enum
# For HDF5 1.8.16 or higher, the size and precision are set optimally
nucleotide_enum$get_size()
nucleotide_enum$get_precision()



