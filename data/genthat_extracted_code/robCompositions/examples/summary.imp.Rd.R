library(robCompositions)


### Name: summary.imp
### Title: Summary method for objects of class imp
### Aliases: summary.imp
### Keywords: print

### ** Examples


data(expenditures)
expenditures[1,3]
expenditures[1,3] <- NA
xi <- impKNNa(expenditures)
xi
summary(xi)
# plot(xi, which=1:2)




