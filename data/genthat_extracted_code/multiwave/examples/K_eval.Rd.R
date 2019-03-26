library(multiwave)


### Name: K_eval
### Title: Evaluation of function K
### Aliases: K_eval
### Keywords: ts

### ** Examples

res_filter <- scaling_filter('Daubechies',8);
filter <- res_filter$h
M <- res_filter$M
alpha <- res_filter$alpha
res_psi <- psi_hat_exact(filter,J=10)
K_eval(res_psi$psih,res_psi$grid,d=c(0.2,0.2))



