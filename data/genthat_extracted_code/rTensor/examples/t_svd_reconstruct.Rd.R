library(rTensor)


### Name: t_svd_reconstruct
### Title: Reconstruct Tensor From TSVD
### Aliases: t_svd_reconstruct

### ** Examples

tnsr <- rand_tensor(c(10,10,10))
tsvdD <- t_svd(tnsr)
1 - fnorm(t_svd_reconstruct(tsvdD)-tnsr)/fnorm(tnsr)



