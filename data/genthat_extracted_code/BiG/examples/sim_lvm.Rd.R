library(BiG)


### Name: sim_lvm
### Title: Simulate rank data from latent variable model
### Aliases: sim_lvm

### ** Examples

set.seed(1234)
sim_lvm(G=25, S=6, n_p1=3, rho=runif(6,min=0.3,max=0.9), p_p1=0.6, p_p2=0.8, 
        lambda=runif(6,min=0.6,max=0.8), n_T=sample(c(5,10,15),6,replace=TRUE))



