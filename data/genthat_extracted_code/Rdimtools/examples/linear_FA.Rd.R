library(Rdimtools)


### Name: do.fa
### Title: Exploratory Factor Analysis
### Aliases: do.fa

### ** Examples

## Not run: 
##D ## generate data
##D X = aux.gensamples(n=496)
##D 
##D ## 1. use centered data
##D output1 <- do.fa(X,ndim=2)
##D 
##D ## 2. use decorrelated data
##D output2 <- do.fa(X,ndim=2,preprocess="decorrelate")
##D 
##D ## 3. use whitened data
##D output3 <- do.fa(X,ndim=2,preprocess="whiten")
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="centered")
##D plot(output2$Y[,1],output2$Y[,2],main="decorrelated")
##D plot(output3$Y[,1],output3$Y[,2],main="whitened")
## End(Not run)




