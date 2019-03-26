library(DataPackageR)


### Name: use_data_object
### Title: Add a data object to a data package.
### Aliases: use_data_object

### ** Examples

if(rmarkdown::pandoc_available()){
myfile <- tempfile()
file <- system.file("extdata", "tests", "extra.rmd",
                     package = "DataPackageR")
datapackage_skeleton(
  name = "datatest",
  path = tempdir(),
  code_files = file,
  force = TRUE,
  r_object_names = "data")
use_data_object(object_name = "newobject")
}




