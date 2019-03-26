library(MSGLasso)


### Name: Cal_grpWTs
### Title: An auxilary function calculating the group weighting matrix
###   'grpWTs' required when calling the MSGlasso function.
### Aliases: Cal_grpWTs
### Keywords: auxilaries

### ** Examples


###########################################################################
## generating the grp.WTs matrix for an overlapping group structure
###########################################################################

P <- 200
Q <- 200
G <- 10
R <- 10
gmax <- 1

GarrStarts <-c(0,20,40,60,80,100,120,140,160,180)
GarrEnds <-c(19,39,59,79,99,119,139,159,179,199)
RarrStarts <-c(0,20,40,60,80,100,120,140,160,180)
RarrEnds <-c(19,39,59,79,99,119,139,159,179,199)

tmp <- FindingPQGrps(P, Q, G, R, gmax, GarrStarts, GarrEnds, RarrStarts, RarrEnds)
PQ.grps <- tmp$PQgrps

tmp1 <- Cal_grpWTs(P, Q, G, R, gmax, PQ.grps)
grp.WTs <- tmp1$grpWTs



