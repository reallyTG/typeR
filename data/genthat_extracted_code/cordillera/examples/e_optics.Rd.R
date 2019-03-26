library(cordillera)


### Name: e_optics
### Title: OPTICS in ELKI
### Aliases: e_optics
### Keywords: clustering multivariate

### ** Examples

## No test: 
data(iris)
res<-e_optics(iris[,1:4],minpts=2,epsilon=100)
print(res)
summary(res)
plot(res,withlabels=TRUE)
## End(No test)





