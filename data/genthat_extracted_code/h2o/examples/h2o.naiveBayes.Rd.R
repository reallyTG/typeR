library(h2o)


### Name: h2o.naiveBayes
### Title: Compute naive Bayes probabilities on an H2O dataset.
### Aliases: h2o.naiveBayes

### ** Examples

## No test: 
h2o.init()
votes_path <- system.file("extdata", "housevotes.csv", package = "h2o")
votes <- h2o.uploadFile(path = votes_path, header = TRUE)
h2o.naiveBayes(x = 2:17, y = 1, training_frame = votes, laplace = 3)
## End(No test)



