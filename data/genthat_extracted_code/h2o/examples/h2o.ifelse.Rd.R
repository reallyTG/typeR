library(h2o)


### Name: h2o.ifelse
### Title: H2O Apply Conditional Statement
### Aliases: h2o.ifelse ifelse

### ** Examples

## No test: 
h2o.init()
australia_path <- system.file("extdata", "australia.csv", package = "h2o")
australia <- h2o.importFile(path = australia_path)
australia[,9] <- ifelse(australia[,3] < 279.9, 1, 0)
summary(australia)
## End(No test)



