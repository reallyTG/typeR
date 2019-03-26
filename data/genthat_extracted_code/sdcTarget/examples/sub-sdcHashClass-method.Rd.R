library(sdcTarget)


### Name: [,sdcHashClass-method
### Title: Get a Hash List Subset
### Aliases: [,sdcHashClass-method

### ** Examples

my.X <- data.frame(matrix(ifelse(runif(5000)>.5, TRUE, FALSE), ncol = 50))
my.hc <- new("sdcHashClass", X = my.X)
my.hc[2:3]



