library(apTreeshape)


### Name: index.test
### Title: Perform a test on the Yule or PDA hypothesis based on the
###   Colless or the Sackin statistic
### Aliases: colless.test sackin.test
### Keywords: htest

### ** Examples


## Test on a randomly generated Yule tree with 30 tips
a<-rtreeshape(1,30,model="yule")
a<-a[[1]]
  
## Is it more balanced than a Yule tree ?
colless.test(a,alternative="less",model="yule")
## Is it less balanced than a PDA tree ?
colless.test(a,model="pda",alternative="greater")
 
## Test on the phylogenetic tree hiv.treeshape: is it more balanced than 
##      predicted by the Yule model?
data(hivtree.treeshape)
## The tree looks compatible with the null hypothesis
colless.test(hivtree.treeshape, alternative="greater", model="yule")
 
## What happen when we look at the top the tree?
colless.test(cutreeshape(hivtree.treeshape, 160, "top"),
      alternative="greater", model="yule")
colless.test(cutreeshape(hivtree.treeshape, 160, "top"), 
      alternative="greater", model="pda")

## Test with the Sackin's index: is the HIV tree less balanced than 
##      predicted by the PDA model?
sackin.test(hivtree.treeshape,alternative="greater",model="pda") 
## The p.value equals to 1...



