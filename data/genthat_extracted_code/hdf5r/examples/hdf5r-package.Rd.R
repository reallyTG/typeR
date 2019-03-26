library(hdf5r)


### Name: hdf5r-package
### Title: hdf5r: A package to provide an interface to hdf5 from R
### Aliases: hdf5r-package

### ** Examples

test_file <- tempfile(fileext=".h5")
file.h5 <- H5File$new(test_file, mode="w")

data(cars)
file.h5$create_group("test")
file.h5[["test/cars"]] <- cars
cars_ds <- file.h5[["test/cars"]]
h5attr(cars_ds, "rownames") <- rownames(cars)

# Close the file at the end
# the 'close' method closes only the file-id, but leaves object inside the file open
# This may prevent re-opening of the file. 'close_all' closes the file and all objects in it
file.h5$close_all()
# now re-open it 
file.h5 <- H5File$new(test_file, mode="r+")

# lets look at the content
file.h5$ls(recursive=TRUE)

cars_ds <- file.h5[["test/cars"]]
# note that for now tables in HDF5 are 1-dimensional, not 2-dimensional
mycars <- cars_ds[]
h5attr_names(cars_ds)
h5attr(cars_ds, "rownames")

file.h5$close_all()



