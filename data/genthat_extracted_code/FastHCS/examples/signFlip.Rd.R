library(FastHCS)


### Name: signFlip
### Title: Carries out the signflip adjustment of a loadings matrix
### Aliases: signFlip
### Keywords: multivariate robust

### ** Examples

x<-diag(10)
x[1,1]<--2
W<-signFlip(x)
W[1,1]



