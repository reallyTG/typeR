library(denoiSeq)


### Name: setReplicates
### Title: Generic for the altering setReplicates slot.
### Aliases: setReplicates setReplicates,readsData-method

### ** Examples

RD <- new("readsData", counts = ERCC)
reps <- list(A = c(2,4,5,3,10),B = c(9,7,1,8,6))
RD <- setReplicates(RD, reps)
RD@replicates




