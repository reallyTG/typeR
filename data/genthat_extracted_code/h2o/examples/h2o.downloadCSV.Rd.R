library(h2o)


### Name: h2o.downloadCSV
### Title: Download H2O Data to Disk
### Aliases: h2o.downloadCSV

### ** Examples

## No test: 
library(h2o)
h2o.init()
iris_hf <- as.h2o(iris)

file_path <- paste(getwd(), "my_iris_file.csv", sep = .Platform$file.sep)
h2o.downloadCSV(iris_hf, file_path)
file.info(file_path)
file.remove(file_path)
## End(No test)



