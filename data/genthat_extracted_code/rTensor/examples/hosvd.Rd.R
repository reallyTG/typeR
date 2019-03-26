library(rTensor)


### Name: hosvd
### Title: (Truncated-)Higher-order SVD
### Aliases: hosvd

### ** Examples

tnsr <- rand_tensor(c(6,7,8))
hosvdD <-hosvd(tnsr)
hosvdD$fnorm_resid
hosvdD2 <-hosvd(tnsr,ranks=c(3,3,4))
hosvdD2$fnorm_resid



