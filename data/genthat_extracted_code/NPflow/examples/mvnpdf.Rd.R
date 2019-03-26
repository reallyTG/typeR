library(NPflow)


### Name: mvnpdf
### Title: multivariate-Normal probability density function
### Aliases: mvnpdf

### ** Examples


mvnpdf(x=matrix(1.96), mean=0, varcovM=diag(1), Log=FALSE)
dnorm(1.96)

mvnpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
      mean=c(0, 0), varcovM=diag(2), Log=FALSE
)




