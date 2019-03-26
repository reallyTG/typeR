library(multipol)


### Name: polyprod
### Title: Multivariate polynomial product
### Aliases: polyprod
### Keywords: array

### ** Examples

a <- as.multipol(matrix(1,2,2))     # 1+x+y+xy

polyprod(a,a)       # (1+x+y+xy)*(1+z+t+zt)   --- offset=0
polyprod(a,a,1)     # (1+x+y+xy)*(1+y+z+yz)
polyprod(a,a,2)     # (1+x+y+xy)^2




