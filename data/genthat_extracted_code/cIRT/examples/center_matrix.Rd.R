library(cIRT)


### Name: center_matrix
### Title: Center a Matrix
### Aliases: center_matrix

### ** Examples

nobs = 500
nvars = 20
x = matrix(rnorm(nobs*nvars),nrow=nobs,ncol=nvars)
r_centered = scale(x)
arma_centered1 = center_matrix(x)



