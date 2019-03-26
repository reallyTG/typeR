library(apTreeshape)


### Name: maxlik.betasplit
### Title: Maximum likelihood of beta in the Beta-splitting model
### Aliases: maxlik.betasplit
### Keywords: htest

### ** Examples

tree.pda<-rtreeshape(n=1, tip.number=50, model="pda")[[1]]
maxlik.betasplit(tree.pda,confidence.interval="none")
##bootstrap example is commented because it is too slow to run
##maxlik.betasplit(tree.pda,confidence.interval="bootstrap")
maxlik.betasplit(tree.pda,confidence.interval="profile")



