library(mvc)


### Name: consensusMeansPerClVSkm
### Title: Calculate means per Cluster and view for Spherical k-Means by
###   using a consensus approach.
### Aliases: consensusMeansPerClVSkm

### ** Examples
{
view1 = structure(c(1, 1, -1, 0, 1, 0, -1, -1), .Dim = c(4L, 2L))
view2 = structure(c(1, 1, -1, 0, 1, 0, -1, 0), .Dim = c(4L, 2L))
view1Idx = c(2, 2, 1, 1)
view2Idx = c(2, 1, 1, 1)
mPerClV=consensusMeansPerClVSkm(view1,view2,view1Idx,view2Idx)
dput(mPerClV) 
}


