library(GSE)


### Name: partial.mahalanobis
### Title: Partial Square Mahalanobis Distance
### Aliases: partial.mahalanobis

### ** Examples

## Not run: 
##D ## suppose we would like to compute pmd for an MLE
##D x <- matrix(rnorm(1000),100,10)
##D U <- matrix(rbinom(1000,1,0.1),100,10)
##D x <- x * ifelse(U==1,NA,1)
##D ## compute MLE (i.e. EM in this case)
##D res <- CovEM(x)
##D ## compute pmd
##D res.pmd <- partial.mahalanobis(x, mu=getLocation(res), S=getScatter(res))
##D summary(res.pmd)
##D plot(res.pmd, which="index")
## End(Not run)



