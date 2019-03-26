library(hdf5r)


### Name: H5D-class
### Title: Class for representing HDF5 datasets
### Aliases: H5D-class H5D

### ** Examples

# First create a file to create datasets in it
fname <- tempfile(fileext = ".h5")
file <- H5File$new(fname, mode = "a")

# Show the 3 different ways how to create a dataset
file[["directly"]] <- matrix(1:10, ncol=2)
file$create_dataset("from_robj", matrix(1:10, ncol=2))
dset <- file$create_dataset("basic", dtype=h5types$H5T_NATIVE_INT,
             space=H5S$new("simple", dims=c(5, 2), maxdims=c(10,2)), chunk_dims=c(5,2))

# Different ways of reading the dataset
dset$read(args=list(1:5, 1))
dset$read(args=list(1:5, quote(expr=)))
dset$read(args=list(1:5, NULL))
dset[1:5, 1]
dset[1:5, ]
dset[1:5, NULL]

# Writing to the dataset
dset$write(args=list(1:3, 1:2), value=11:16)
dset[4:5, 1:2] <- -(1:4)
dset[,]

# Extract key information
dset$dims
dset$maxdims
dset$chunk_dims
dset$key_info
dset

file$close_all()
file.remove(fname)



