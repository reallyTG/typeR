library(PeakSegJoint)


### Name: featureMatrixJoint
### Title: featureMatrixJoint
### Aliases: featureMatrixJoint

### ** Examples

library(PeakSegJoint)
data(H3K36me3.TDH.other.chunk1, envir=environment())
lims <- c(43000000, 43200000) # left
some.counts <-
  subset(H3K36me3.TDH.other.chunk1$counts,
         lims[1] < chromEnd & chromStart < lims[2])
profile.list <- ProfileList(some.counts)
featureMatrixJoint(profile.list)



