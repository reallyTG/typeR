library(apTreeshape)


### Name: subtree.test
### Title: Test the Yule or PDA hypothesis
### Aliases: subtree.test
### Keywords: htest

### ** Examples


## Generate a random pda tree with 50 tips
tr<-rtreeshape(n=1,tip.number=50,model="pda")
tr<-tr[[1]]

## Test the yule hypothesis, using subtrees of size 2 (Cherries), 
##      with the alternative hypothesis "less"
subtree.test(tr,size=2,alternative="less")



