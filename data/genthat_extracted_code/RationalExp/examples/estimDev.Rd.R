library(RationalExp)


### Name: estimDev
### Title: Estimation of the minimal deviations from rational expectations
###   with unconstrained information set g*
### Aliases: estimDev

### ** Examples

n_p=200
n_y=200
sig=0.1
u=1
b=0.10
a=2
rho= 0.4
psi <- rnorm(n_p,0,u)
pp_y <- runif(n_y,0,1)
zeta <- rnorm(n_y,a,sig)
zeta1 <- rnorm(n_y,-a,sig)
pp1_y <- 1*(pp_y <b)
pp2_y <- 1*(pp_y >1-b)
pp3_y <- 1*(pp_y <=(1-b) & pp_y >=b)
psi_y <-rnorm(n_p,0,u)
y = rho*psi_y+ pp1_y*zeta + pp2_y*zeta1

g_star <- estimDev(psi,y)





