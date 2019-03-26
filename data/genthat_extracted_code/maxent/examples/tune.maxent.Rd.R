library(maxent)


### Name: tune.maxent
### Title: fits a maximum entropy model given a training matrix and a
###   vector or factor of labels.
### Aliases: tune.maxent
### Keywords: methods

### ** Examples

# LOAD LIBRARY
library(maxent)

# A DIFFERENT EXAMPLE
data(iris)
attach(iris)

x <- subset(iris, select = -Species)
y <- Species

f <- tune.maxent(x,y,nfold=3,showall=TRUE)



