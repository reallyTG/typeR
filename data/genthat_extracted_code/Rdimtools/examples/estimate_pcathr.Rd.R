library(Rdimtools)


### Name: est.pcathr
### Title: PCA Thresholding with Accumulated Variance
### Aliases: est.pcathr

### ** Examples

## Not run: 
##D ## generate 3-dimensional normal data
##D X = matrix(rnorm(100*3), nrow=100)
##D 
##D ## replicate 3 times with translations
##D Y = cbind(X-10,X,X+10)
##D 
##D ## use PCA thresholding estimation with 95% variance explainability
##D ## desired return is for dimension 3.
##D output   = est.pcathr(Y)
##D pmessage = paste("* estimated dimension is ",output$estdim, sep="")
##D print(pmessage)
##D 
##D ## use screeplot
##D plot(output$values, main="scree plot")
## End(Not run)




