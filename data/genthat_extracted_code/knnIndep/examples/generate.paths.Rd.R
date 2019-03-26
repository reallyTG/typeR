library(knnIndep)


### Name: generate.paths
### Title: Generate all nearest neighbours distances for one point in a
###   sample
### Aliases: generate.paths

### ** Examples

    x=rank(runif(10))
    y=rank(runif(10))
    knnIndep:::generate.paths(5,x,y,10)
    #for all points in the sample
    sapply(1:10,knnIndep:::generate.paths,x,y,10)



