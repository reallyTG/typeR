library(SHIP)


### Name: targetGpos
### Title: Computation of the target Gpos.
### Aliases: targetGpos
### Keywords: methods multivariate

### ** Examples

# A short example on a toy dataset
# require(SHIP)
data(expl)
attach(expl)
tar <- targetGpos(x,genegroups)
which(tar[upper.tri(tar)]!=0) # not many non zero coefficients !



