library(TopKLists)


### Name: CEMC
### Title: CEMC based rank aggregation
### Aliases: CEMC

### ** Examples

#small data set; a larger data example is available in the vignettes
L1=c("chicken","dog","cat")
L2=c(1,"chicken","cat", 2:5)
L3=c("dog","chicken",1:10)
input=list(L1,L2,L3)
space1=c("chicken","dog","cat",1:10)
space=list(space1,space1,space1)
outCEMC=CEMC(input, space) #underlying space-dependent



