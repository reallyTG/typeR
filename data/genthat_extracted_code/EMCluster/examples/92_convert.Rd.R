library(EMCluster)


### Name: Conversion
### Title: Convert Matrices in Different Format
### Aliases: LTSigma2variance variance2LTSigma LTsigma2var var2LTsigma
###   class2Gamma Gamma2class
### Keywords: utility

### ** Examples

## Not run: 
##D library(EMCluster, quietly = TRUE)
##D x <- da2$LTSigma
##D class <- da2$class
##D 
##D y <- LTSigma2variance(x)
##D str(y)
##D y <- variance2LTSigma(y)
##D str(y)
##D sum(x != y)
##D 
##D Gamma <- class2Gamma(class)
##D class.new <- Gamma2class(Gamma)
##D sum(class != class.new)
## End(Not run)



