library(metagen)


### Name: designD
### Title: Design: Gaussian responses (unknown heteroscedasticity)
### Aliases: designD

### ** Examples

dD <- designD(n=15L, h_bounds=c(0,1), d_bounds=c(0.01,2),
  s_bounds=c(200L,2000L), x=cbind(1,1:7))

if(!all(dim(dD) == c(15,2*dim(cbind(1,1:7))[1]+1))) {
  stop("Wrong dimension")
}



