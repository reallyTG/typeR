library(polysat)


### Name: assignClones
### Title: Group Individuals Based on a Distance Threshold
### Aliases: assignClones
### Keywords: arith

### ** Examples

# set up a simple matrix with three samples
test <- matrix(c(0,0,.5,0,0,.5,.5,.5,0), ncol=3, nrow=3)
abc <- c("a", "b", "c")
dimnames(test) <- list(abc,abc)

# assign clones with a threshold of zero or 0.5
assignClones(test)
assignClones(test, threshold=0.5)



