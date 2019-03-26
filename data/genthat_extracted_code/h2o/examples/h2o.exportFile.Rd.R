library(h2o)


### Name: h2o.exportFile
### Title: Export an H2O Data Frame (H2OFrame) to a File or to a collection
###   of Files.
### Aliases: h2o.exportFile

### ** Examples

## Not run: 
##D library(h2o)
##D h2o.init()
##D iris_hf <- as.h2o(iris)
##D 
##D # These aren't real paths
##D # h2o.exportFile(iris_hf, path = "/path/on/h2o/server/filesystem/iris.csv")
##D # h2o.exportFile(iris_hf, path = "hdfs://path/in/hdfs/iris.csv")
##D # h2o.exportFile(iris_hf, path = "s3n://path/in/s3/iris.csv")
## End(Not run)



