library(NPflow)


### Name: mvtpdf
### Title: multivariate Student's t-distribution probability density
###   function
### Aliases: mvtpdf

### ** Examples

mvtpdf(x=matrix(1.96), mean=0, varcovM=diag(1), df=10000000)
mvnpdf(x=matrix(1.96), mean=0, varcovM=diag(1))

mvtpdf(x=matrix(1.96), mean=0, varcovM=diag(1), df=10)

mvtpdf(x=matrix(rep(1.96,2), nrow=2, ncol=1),
      mean=c(0, 0), varcovM=diag(2), df=10
)




