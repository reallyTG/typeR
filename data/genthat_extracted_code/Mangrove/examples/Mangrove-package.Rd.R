library(Mangrove)


### Name: Mangrove-package
### Title: Mangrove: Risk prediction on trees
### Aliases: Mangrove-package Mangrove
### Keywords: package

### ** Examples

data(exampleORs)
data(famped)
tree <- initialiseTree()
tree$addPed(famped,exampleORs)
sam <- tree$getPrevs(exampleORs,K=0.02)
plotNaivePrev(famped,0.02)
plot(sam)




