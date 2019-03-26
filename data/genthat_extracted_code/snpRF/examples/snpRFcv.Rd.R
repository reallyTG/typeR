library(snpRF)


### Name: snpRFcv
### Title: Random Forest Cross-Valdidation for feature selection
### Aliases: snpRFcv
### Keywords: classif

### ** Examples

set.seed(647)
data(snpRFexample)
result <- snpRFcv(trainx.autosome=autosome.snps,trainx.xchrom=xchrom.snps,
                  trainx.covar=covariates, trainy=phenotype)
with(result, plot(n.var, error.cv, log="x", type="o", lwd=2))

## The following can take a while to run, so if you really want to try
## it, copy and paste the code into R.

## Not run: 
##D result <- replicate(5,snpRFcv(trainx.autosome=autosome.snps,
##D                               trainx.xchrom=xchrom.snps,
##D                               trainx.covar=covariates, trainy=phenotype), 
##D 		    simplify=FALSE)
##D error.cv <- sapply(result, "[[", "error.cv")
##D matplot(result[[1]]$n.var, cbind(rowMeans(error.cv), error.cv), type="l",
##D         lwd=c(2, rep(1, ncol(error.cv))), col=1, lty=1, log="x",
##D         xlab="Number of variables", ylab="CV Error")
## End(Not run)



