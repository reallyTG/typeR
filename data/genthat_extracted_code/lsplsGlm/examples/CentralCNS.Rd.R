library(lsplsGlm)


### Name: CentralCNS
### Title: Gene expression and clinical data used to predict tumors of
###   Central Nervous System from children
### Aliases: CentralCNS

### ** Examples

# load dataset
data(CentralCNS)

# how many patients and how many genes ?
dim(CentralCNS$X)

# how many patients of class 0 and 1 respectively ?
sum(CentralCNS$Y==0)
sum(CentralCNS$Y==1)



