library(DataPackageR)


### Name: use_raw_dataset
### Title: Add a raw data set to inst/extdata
### Aliases: use_raw_dataset

### ** Examples

if(rmarkdown::pandoc_available()){
myfile <- tempfile()
file <- system.file("extdata", "tests", "extra.rmd",
                     package = "DataPackageR")
raw_data <- system.file("extdata", "tests", "raw_data",
                        package = "DataPackageR")
datapackage_skeleton(
  name = "datatest",
  path = tempdir(),
  code_files = file,
  force = TRUE,
  r_object_names = "data")
use_raw_dataset(raw_data)
}



