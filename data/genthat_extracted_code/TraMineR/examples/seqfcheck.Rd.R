library(TraMineR)


### Name: seqfcheck
### Title: Check if sequences are in the compressed or extended format
### Aliases: seqfcheck
### Keywords: Data handling internal

### ** Examples

## The sequences in the actcal data set
## are in the extended format
data(actcal)
head(actcal[,13:24])
seqfcheck(actcal[,13:24])

## The sequences in the famform data set
## are in the compressed format
data(famform)
famform
seqfcheck(famform)



