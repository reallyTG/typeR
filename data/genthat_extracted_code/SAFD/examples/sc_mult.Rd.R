library(SAFD)


### Name: sc_mult
### Title: Minkowski scalar multiplication
### Aliases: sc_mult
### Keywords: arith manip

### ** Examples

#Example 1:
U<-data.frame(x=c(-1,0,1),alpha=c(0,1,0))
E<-sc_mult(U,2)
E

#Example 2:
X<-data.frame(x=c(0,1,1,5),alpha=c(0,1,1,0))
sc_prod<-sc_mult(X,1.5)
sc_prod



#Example 3:
data(XX)
X<-translator(XX[[1]],10)
E<-sc_mult(X,-2,pic=1)
E



