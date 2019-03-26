library(SHIP)


### Name: targetF
### Title: Computation of target F ('constant correlation model').
### Aliases: targetF
### Keywords: methods multivariate

### ** Examples

# A short example on a toy dataset
# require(SHIP)
data(expl)
attach(expl)
tar <- targetF(x,NULL)
which(tar[upper.tri(tar)]!=0) # many non zero coefficients !



