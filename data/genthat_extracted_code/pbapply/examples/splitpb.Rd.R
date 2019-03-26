library(pbapply)


### Name: splitpb
### Title: Divide Tasks for Progress-bar Friendly Distribution in a Cluster
### Aliases: splitpb
### Keywords: utilities

### ** Examples

## define 1 job / worker at a time and repeat
splitpb(10, 4)
## compare this to the no-progress-bar split
## that defines all the jubs / worker up front
parallel::splitIndices(10, 4)

## cap the length of the output
splitpb(20, 2, nout = NULL)
splitpb(20, 2, nout = 5)



