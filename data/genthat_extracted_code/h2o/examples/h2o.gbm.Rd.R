library(h2o)


### Name: h2o.gbm
### Title: Build gradient boosted classification or regression trees
### Aliases: h2o.gbm

### ** Examples

## No test: 
library(h2o)
h2o.init()

# Run regression GBM on australia data
australia_path <- system.file("extdata", "australia.csv", package = "h2o")
australia <- h2o.uploadFile(path = australia_path)
independent <- c("premax", "salmax","minairtemp", "maxairtemp", "maxsst",
"maxsoilmoist", "Max_czcs")
dependent <- "runoffnew"
h2o.gbm(y = dependent, x = independent, training_frame = australia,
ntrees = 3, max_depth = 3, min_rows = 2)
## End(No test)



