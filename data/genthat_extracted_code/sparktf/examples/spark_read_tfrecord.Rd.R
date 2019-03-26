library(sparktf)


### Name: spark_read_tfrecord
### Title: Read a TFRecord File
### Aliases: spark_read_tfrecord

### ** Examples

## Not run: 
##D iris_tbl <- copy_to(sc, iris)
##D data_path <- file.path(tempdir(), "iris")
##D df1 <- iris_tbl %>%
##D ft_string_indexer_model(
##D   "Species", "label",
##D   labels = c("setosa", "versicolor", "virginica")
##D )
##D 
##D df1 %>%
##D spark_write_tfrecord(
##D   path = data_path,
##D   write_locality = "local"
##D )
##D 
##D spark_read_tfrecord(sc, data_path)
## End(Not run)




