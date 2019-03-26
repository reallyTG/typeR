library(metagen)


### Name: designY
### Title: Design: Gaussian responses (known heteroscedasticity)
### Aliases: designY

### ** Examples

dY <- designY(n=15L, h_bounds=c(0,1), d_bounds=c(0.01,2),
x=cbind(1,1:7))

if(!all(dim(dY) == c(15,dim(cbind(1,1:7))[1]+1))) {
  stop("Wrong dimension")
}



