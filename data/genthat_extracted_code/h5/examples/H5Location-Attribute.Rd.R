library(h5)


### Name: H5Location-Attribute
### Title: Read and Create Attributes for H5Location Objects
### Aliases: H5Location-Attribute H5Location H5Location-class
###   createAttribute createAttribute,H5Location,character-method
###   openAttribute openAttribute,H5Location,character-method h5attr
###   h5attr,H5Location,character-method h5attr<-
###   h5attr<-,H5Location,character-method list.attributes
###   list.attributes,H5Location-method

### ** Examples

# Write Attributes for H5File, H5Group and DataSet
file <- h5file("test.h5")
h5attr(file, "fileattrib") <- 1:10
group <- file["testgroup"]
h5attr(group, "groupattrib") <- matrix(1:9, nrow = 3)
h5attr(group, "groupattrib")
group["testdataset"] <- 1:10
dset <- group["testdataset"]
h5attr(dset, "dsetattrib") <- LETTERS[1:10]
h5close(dset)
h5close(group)
h5close(file)
file.remove("test.h5")



