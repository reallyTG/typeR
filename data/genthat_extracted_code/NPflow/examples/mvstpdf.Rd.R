library(NPflow)


### Name: mvstpdf
### Title: multivariate skew-t probability density function
### Aliases: mvstpdf

### ** Examples

mvstpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
      xi=c(0, 0), psi=c(1, 1), sigma=diag(2),
      df=100000000, Log=FALSE
)
mvsnpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
      xi=c(0, 0), psi=c(1, 1), sigma=diag(2),
      Log=FALSE
)
mvstpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
      xi=c(0, 0), psi=c(1, 1), sigma=diag(2),
      df=100000000
)
mvsnpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
      xi=c(0, 0), psi=c(1, 1), sigma=diag(2)
)





