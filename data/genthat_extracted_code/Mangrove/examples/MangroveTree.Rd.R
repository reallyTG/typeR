library(Mangrove)


### Name: MangroveTree
### Title: The MangroveTree class
### Aliases: MangroveTree initialiseTree getPrevs addPed
###   summary.MangroveTree print.MangroveTree plot.MangroveTree
### Keywords: classes methods htest

### ** Examples

data(famped)
data(exampleORs)

tree <- initialiseTree()
tree$addPed(famped,exampleORs)

print(tree)
summary(tree)

sam <- tree$getPrevs(exampleORs,K=0.02)
summary(sam)



