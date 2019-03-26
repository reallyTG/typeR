library(metagen)


### Name: designB
### Title: Design: Binomial responses
### Aliases: designB

### ** Examples

dB <- designB(n=15L, h_bounds=c(0,1), a_bounds=c(-.3,3),
  s_bounds=c(200L,2000L), r=0.03, x=cbind(1,1:5))

if(!all(dim(dB) == c(15,2*dim(cbind(1,1:5))[1]+2))) {
  stop("Wrong dimension")
}



