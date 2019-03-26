library(MOrder)


### Name: checkTH
### Title: Determine if Time Homogeneity is present in the give sequence.
### Aliases: checkTH

### ** Examples

## Check for a homogenous sequence
seq <- c(1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2)
checkTH(seq)

## Check for a heterogenous sequence
seq <- c(1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1)
checkTH(seq)



