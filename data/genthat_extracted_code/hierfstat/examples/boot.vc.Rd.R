library(hierfstat)


### Name: boot.vc
### Title: Bootstrap confidence intervals for variance components
### Aliases: boot.vc
### Keywords: univar

### ** Examples

#load data set
data(gtrunchier)
boot.vc(gtrunchier[,c(1:2)],gtrunchier[,-c(1:2)],nboot=100)



