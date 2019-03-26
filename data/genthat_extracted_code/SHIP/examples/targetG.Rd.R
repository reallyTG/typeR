library(SHIP)


### Name: targetG
### Title: Computation of target G ('knowledge-based constant correlation
###   model').
### Aliases: targetG
### Keywords: methods multivariate

### ** Examples

# A short example on a toy dataset
# require(SHIP)
data(expl)
attach(expl)
tar <- targetG(x,genegroups)
which(tar[upper.tri(tar)]!=0) # not many non zero coefficients !



