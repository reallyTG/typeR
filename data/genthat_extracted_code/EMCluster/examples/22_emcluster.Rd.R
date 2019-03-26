library(EMCluster)


### Name: EM Algorithm
### Title: EM Algorithm for model-based clustering
### Aliases: emcluster shortemcluster simple.init 'emret class' 'emobj
###   object'
### Keywords: programming

### ** Examples

library(EMCluster, quietly = TRUE)
set.seed(1234)
x1 <- da1$da

emobj <- simple.init(x1, nclass = 10)
emobj <- shortemcluster(x1, emobj)
summary(emobj)

ret <- emcluster(x1, emobj, assign.class = TRUE)
summary(ret)



