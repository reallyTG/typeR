library(TraMineR)


### Name: seqfpos
### Title: Search for the first occurrence of a given element in a sequence
### Aliases: seqfpos
### Keywords: Longitudinal characteristics

### ** Examples

data(biofam)
biofam.seq <- seqdef(biofam,10:25)

## Searching for the first occurrence of state 1
## in each of the 5 first sequence of the biofam data set.
seqfpos(biofam.seq[1:5,],"1")



