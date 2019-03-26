library(h2o)


### Name: h2o.stringdist
### Title: Compute element-wise string distances between two H2OFrames
### Aliases: h2o.stringdist

### ** Examples

## No test: 
h2o.init()
x <- as.h2o(c("Martha", "Dwayne", "Dixon"))
y <- as.character(as.h2o(c("Marhta", "Duane", "Dicksonx")))
h2o.stringdist(x, y, method = "jw")
## End(No test)



