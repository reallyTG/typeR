library(robCompositions)


### Name: plot.imp
### Title: Plot method for objects of class imp
### Aliases: plot.imp
### Keywords: aplot hplot

### ** Examples


data(expenditures)
expenditures[1,3]
expenditures[1,3] <- NA
xi <- impKNNa(expenditures)
xi
summary(xi)
## Not run: plot(xi, which=1)
plot(xi, which=2)
plot(xi, which=3)
plot(xi, which=3, seg1=FALSE)




