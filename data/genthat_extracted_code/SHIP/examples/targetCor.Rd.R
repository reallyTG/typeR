library(SHIP)


### Name: targetCor
### Title: Computation of the target Cor.
### Aliases: targetCor
### Keywords: methods multivariate

### ** Examples

# A short example on a toy dataset
# require(SHIP)
data(expl)
attach(expl)
tar <- targetCor(x,genegroups)
which(tar[upper.tri(tar)]!=0) # not many non zero coefficients !



