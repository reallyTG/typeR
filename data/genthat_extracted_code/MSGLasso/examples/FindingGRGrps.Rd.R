library(MSGLasso)


### Name: FindingGRGrps
### Title: An auxilary function calculating the containing variable index
###   for each predictor (or response) group. It generates the required
###   input 'GR.grps' matrix when calling the MSGlasso function.
### Aliases: FindingGRGrps
### Keywords: auxilaries

### ** Examples


###########################################################################
## generating the GR.grps matrix for an overlapping group structure
###########################################################################

P <- 200
Q <- 200
G <- 10
R <- 10
cmax <- 400

GarrStarts <-c(0,20,40,60,80,100,120,140,160,180)
GarrEnds <-c(19,39,59,79,99,119,139,159,179,199)
RarrStarts <-c(0,20,40,60,80,100,120,140,160,180)
RarrEnds <-c(19,39,59,79,99,119,139,159,179,199)

tmp <- FindingGRGrps(P, Q, G, R, cmax, GarrStarts, GarrEnds, RarrStarts, RarrEnds)
GR.grps <- tmp$GRgrps




