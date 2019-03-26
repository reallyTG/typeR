library(stima)


### Name: prune.rt
### Title: Pruning of a regression trunk.
### Aliases: prune.rt
### Keywords: prune

### ** Examples

#Example with employee data
data(employee)
#a regression trunk with a maximum of three splits is grown
#variable used for the first split (edu) is third variable in the dataset
#twofold cross-validation is performed to save time in the example,
#tenfold cross-validation is recommended
 
emprt1<-stima(employee,3,first=3,vfold=2)
summary(emprt1)
#prune the regression trunk
emprt1_pr<-prune(emprt1,data=employee)




