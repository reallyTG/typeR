library(NPflow)


### Name: mmvtpdfC
### Title: C++ implementation of multivariate Normal probability density
###   function for multiple inputs
### Aliases: mmvtpdfC

### ** Examples

mvnpdf(x=matrix(1.96), mean=0, varcovM=diag(1), Log=FALSE)
mvtpdf(x=matrix(1.96), mean=0, varcovM=diag(1), df=10000000, Log=FALSE)
mmvtpdfC(x=matrix(1.96), mean=matrix(0), varcovM=list(diag(1)), df=10000000, Log=FALSE)

mvnpdf(x=matrix(1.96), mean=0, varcovM=diag(1))
mvtpdf(x=matrix(1.96), mean=0, varcovM=diag(1), df=10000000)
mmvtpdfC(x=matrix(1.96), mean=matrix(0), varcovM=list(diag(1)), df=10000000)

mvtpdf(x=matrix(1.96), mean=0, varcovM=diag(1), df=10)
mmvtpdfC(x=matrix(1.96), mean=matrix(0), varcovM=list(diag(1)), df=10)


if(require(microbenchmark)){
library(microbenchmark)
microbenchmark(mvtpdf(x=matrix(1.96), mean=0, varcovM=diag(1), df=1, Log=FALSE),
               mmvtpdfC(x=matrix(1.96), mean=matrix(0), varcovM=list(diag(1)),
                        df=c(1), Log=FALSE),
               times=10000L)
}else{
cat("package 'microbenchmark' not available\n")
}



