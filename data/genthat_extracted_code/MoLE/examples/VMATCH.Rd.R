library(MoLE)


### Name: VMATCH
### Title: Compare vectors
### Aliases: VMATCH
### Keywords: misc

### ** Examples

FOUND()
vectors=head(population[[1]]$nouns[,1:9])
target=vectors[1,]
vectors[2,]=NA
VMATCH(target, vectors)



