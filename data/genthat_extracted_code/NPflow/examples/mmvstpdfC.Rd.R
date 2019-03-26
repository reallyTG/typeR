library(NPflow)


### Name: mmvstpdfC
### Title: C++ implementation of multivariate Normal probability density
###   function for multiple inputs
### Aliases: mmvstpdfC

### ** Examples

mmvstpdfC(x = matrix(c(3.399890,-5.936962), ncol=1), xi=matrix(c(0.2528859,-2.4234067)),
psi=matrix(c(11.20536,-12.51052), ncol=1),
sigma=list(matrix(c(0.2134011, -0.0382573, -0.0382573, 0.2660086), ncol=2)),
df=c(7.784106)
)
mvstpdf(x = matrix(c(3.399890,-5.936962), ncol=1), xi=c(0.2528859,-2.4234067),
psi=c(11.20536,-12.51052),
sigma=matrix(c(0.2134011, -0.0382573, -0.0382573, 0.2660086), ncol=2),
df=c(7.784106)
)

#skew-normal limit
mmvsnpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
         xi=matrix(c(0, 0)), psi=matrix(c(1, 1),ncol=1), sigma=list(diag(2))
         )
mvstpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
       xi=c(0, 0), psi=c(1, 1), sigma=diag(2),
       df=100000000
       )
mmvstpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
         xi=matrix(c(0, 0)), psi=matrix(c(1, 1),ncol=1), sigma=list(diag(2)),
         df=100000000
         )

#non-skewed limit
mmvtpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
        mean=matrix(c(0, 0)), varcovM=list(diag(2)),
        df=10
        )
mmvstpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
         xi=matrix(c(0, 0)), psi=matrix(c(0, 0),ncol=1), sigma=list(diag(2)),
         df=10
         )

if(require(microbenchmark)){
library(microbenchmark)
microbenchmark(mvstpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
                       xi=c(0, 0), psi=c(1, 1),
                       sigma=diag(2), df=10),
               mmvstpdfC(x=matrix(rep(1.96,2), nrow=2, ncol=1),
                         xi=matrix(c(0, 0)), psi=matrix(c(1, 1),ncol=1),
                         sigma=list(diag(2)), df=10),
               times=1000L)
}else{
cat("package 'microbenchmark' not available\n")
}



