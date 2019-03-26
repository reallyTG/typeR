library(h2o)


### Name: h2o.head
### Title: Return the Head or Tail of an H2O Dataset.
### Aliases: h2o.head head.H2OFrame h2o.tail tail.H2OFrame

### ** Examples

## No test: 
library(h2o)
h2o.init(ip <- "localhost", port = 54321, startH2O = TRUE)
australia_path <- system.file("extdata", "australia.csv", package = "h2o")
australia <- h2o.uploadFile(path = australia_path)
head(australia, 10)
tail(australia, 10)
## End(No test)



