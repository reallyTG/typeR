library(catnet)


### Name: cnNodeMarginalProb-method
### Title: Probability Calculations
### Aliases: cnNodeMarginalProb cnNodeMarginalProb,catNetwork-method
###   cnJointProb cnJointProb,catNetwork-method cnCondProb
###   cnCondProb,catNetwork-method
### Keywords: methods graphs

### ** Examples

  library(catnet)
  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=2)
  cnNodeMarginalProb(cnet, node=5)
  cnCondProb(cnet, x=c("N1"=1, "N2"=2), y=c("N3"=1, "N4"=2, "N5"=2))



