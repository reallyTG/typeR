library(RationalExp)


### Name: test
### Title: Implementation of the RE test with possible survey weights
###   (direct and with parallel computing)
### Aliases: test

### ** Examples

## The RE test without covariates
n_p=600
n_y=n_p
N <- n_y + n_p
rho <-0.29
sig=0.1
u=1
b=0.10
a=2

psi <-rnorm(n_p,0,u)
pp_y <- runif(n_y,0,1)
zeta <- rnorm(n_y,a,sig)
zeta1 <- rnorm(n_y,-a,sig)
pp1_y <- 1*(pp_y <b)
pp2_y <- 1*(pp_y >1-b)
pp3_y <- 1*(pp_y <=(1-b) & pp_y >=b)
psi_y <-rnorm(n_y,0,u)
y =  rho*psi_y+ pp1_y*zeta + pp2_y*zeta1


D <- rbind(matrix(1,n_y,1),matrix(0,n_p,1))
Y_tilde <- rbind(matrix(y,n_y,1),matrix(psi,n_p,1))

#res <- test(Y_tilde ,D)





