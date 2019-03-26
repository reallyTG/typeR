library(ForImp)


### Name: rancatmat
### Title: Generating a random matrix of ordinal variables
### Aliases: rancatmat
### Keywords: datagen multivariate

### ** Examples

n<-500
m<-3
mat<-rancatmat(n,m,c(3,4,5))
# let's check the marginal distributions...
apply(mat,2,tabulate)
#... should be "quite" uniform



