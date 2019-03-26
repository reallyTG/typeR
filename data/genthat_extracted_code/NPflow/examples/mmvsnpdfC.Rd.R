library(NPflow)


### Name: mmvsnpdfC
### Title: C++ implementation of multivariate skew Normal probability
###   density function for multiple inputs
### Aliases: mmvsnpdfC

### ** Examples

mmvsnpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
         xi=matrix(c(0, 0)), psi=matrix(c(1, 1),ncol=1), sigma=list(diag(2)), Log=FALSE
         )
mmvsnpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
         xi=matrix(c(0, 0)), psi=matrix(c(1, 1),ncol=1), sigma=list(diag(2))
         )

if(require(microbenchmark)){
library(microbenchmark)
microbenchmark(mvsnpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1), xi=c(0, 0), psi=c(1, 1),
                       sigma=diag(2), Log=FALSE),
               mmvsnpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1), xi=matrix(c(0, 0)),
                         psi=matrix(c(1, 1),ncol=1), sigma=list(diag(2)), Log=FALSE),
               times=1000L
             )
microbenchmark(mvsnpdf(x=matrix(c(rep(1.96,2),rep(0,2)), nrow=2, ncol=2),
                      xi=list(c(0,0),c(-1,-1), c(1.5,1.5)),
                      psi=list(c(0.1,0.1),c(-0.1,-1), c(0.5,-1.5)),
                      sigma=list(diag(2),10*diag(2), 20*diag(2)), Log=FALSE),
               mmvsnpdfC(matrix(c(rep(1.96,2),rep(0,2)), nrow=2, ncol=2),
                         xi=matrix(c(0,0,-1,-1, 1.5,1.5), nrow=2, ncol=3),
                         psi=matrix(c(0.1,0.1,-0.1,-1, 0.5,-1.5), nrow=2, ncol=3),
                         sigma=list(diag(2),10*diag(2), 20*diag(2)), Log=FALSE),
              times=1000L)
}else{
cat("package 'microbenchmark' not available\n")
}



