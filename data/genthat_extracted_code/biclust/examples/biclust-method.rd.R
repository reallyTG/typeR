library(biclust)


### Name: biclust
### Title: The biclust Method
### Aliases: biclust biclust-method biclust,matrix,BiclustMethod-method
###   biclust,matrix,function-method biclust,matrix,character-method
### Keywords: cluster

### ** Examples

test <- matrix(rbinom(400, 50, 0.4), 20, 20)
res1 <- biclust(test, method=BCCC(), delta=1.5,  alpha=1, number=10)




