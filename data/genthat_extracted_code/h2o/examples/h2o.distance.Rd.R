library(h2o)


### Name: h2o.distance
### Title: Compute a pairwise distance measure between all rows of two
###   numeric H2OFrames.
### Aliases: h2o.distance

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.distance(prostate[11:30,], prostate[1:10,], "cosine")
## End(No test)



