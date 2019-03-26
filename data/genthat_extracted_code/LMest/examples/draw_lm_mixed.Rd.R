library(LMest)


### Name: draw_lm_mixed
### Title: Draws samples from the mixed LM model
### Aliases: draw_lm_mixed

### ** Examples

# draw a sample for 1000 units and only one response variable and 5 time occasions
k1 = 2; k2 = 3
la = rep(1/k1,k1)
Piv = matrix(1/k2,k2,k1)
Pi = array(0,c(k2,k2,k1))
Pi[,,1] = diag(k2)
Pi[,,2] = 1/k2
Psi = cbind(c(0.6,0.3,0.1),c(0.1,0.3,0.6),c(0.3,0.6,0.1))
out = draw_lm_mixed(la,Piv,Pi,Psi,n=1000,TT=5)



