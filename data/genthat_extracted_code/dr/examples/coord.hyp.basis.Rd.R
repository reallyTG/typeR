library(dr)


### Name: coord.hyp.basis
### Title: Internal function to find the basis of a subspace
### Aliases: coord.hyp.basis
### Keywords: internal

### ** Examples

data(ais)
s1 <- dr(LBM~log(Ht)+log(Wt)+log(RCC)+log(WCC)+log(Hc)+log(Hg),
         data=ais,method="sir")
coord.hyp.basis(s1,~.-log(Wt)-log(Hg))
 


