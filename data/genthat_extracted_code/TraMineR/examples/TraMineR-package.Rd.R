library(TraMineR)


### Name: TraMineR-package
### Title: Trajectory Miner: a Toolbox for Exploring and Rendering
###   Sequences
### Aliases: TraMineR-package TraMineR
### Keywords: package

### ** Examples

## load the mvad data
library(TraMineR)
data(mvad)

## create a state sequence object from columns 17 to 86
mvad.seq <- seqdef(mvad[,17:86])

## distribution plot by sex (male)
seqdplot(mvad.seq, group=mvad$male, border=NA)

## compute the LCS pairwise distance matrix
## among the first 10 sequences
mvad.lcs <- seqdist(mvad.seq[1:10,], method="LCS")



