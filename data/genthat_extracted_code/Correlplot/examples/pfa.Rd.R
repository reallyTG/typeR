library(Correlplot)


### Name: pfa
### Title: Principal factor analysis
### Aliases: pfa
### Keywords: multivariate

### ** Examples

   X <- matrix(rnorm(100),ncol=2)
   out.pfa <- pfa(X)
#  based on a correlation matrix
   R <- cor(X)
   out.pfa <- pfa(R,option="cor")



