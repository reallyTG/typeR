library(TraMineR)


### Name: seqtrate
### Title: Compute transition rates between states
### Aliases: seqtrate
### Keywords: Global characteristics

### ** Examples

  ## Loading the 'actcal' example data set
  data(actcal)

  ## Defining a sequence object with data in columns 13 to 24
  ## (activity status from January to December 2000)
  actcal.seq <- seqdef(actcal[,13:24])

  ## Computing transition rates
  seqtrate(actcal.seq)

  ## Computing transition rates between states "A" and "B" only
  seqtrate(actcal.seq, c("A","B"))

## ====================
## Example with weights
## ====================
data(ex1)
ex1.seq <- seqdef(ex1[,1:13], weights=ex1$weights)

seqtrate(ex1.seq, weighted=FALSE)
seqtrate(ex1.seq, weighted=FALSE, count=TRUE)

## weights are accounted for by default
seqtrate(ex1.seq)
seqtrate(ex1.seq, count=TRUE)




