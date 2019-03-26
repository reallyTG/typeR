library(MixtureInf)


### Name: SLC
### Title: SLC (sodium-lithium countertransport)
### Aliases: SLC
### Keywords: datasets

### ** Examples

#fit a 2 component normal mixture model to this data set, 
#test for order = 2 using EM-test.
data(SLC)
a <- c(0.6,0.4,0.2,0.3,0.01,0.01)
pmle.norm(SLC,2,1,inival=a)
emtest.norm(SLC,2,inival=a,len=5)



