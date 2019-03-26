library(SHIP)


### Name: targetGstar
### Title: Computation of the target Gstar.
### Aliases: targetGstar
### Keywords: methods multivariate

### ** Examples

# A short example on a toy dataset
# require(SHIP)
data(expl)
attach(expl)
tar <- targetGstar(x,genegroups)
which(tar[upper.tri(tar)]!=0) # not many non zero coefficients !



