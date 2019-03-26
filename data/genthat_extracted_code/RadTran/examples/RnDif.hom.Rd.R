library(RadTran)


### Name: RnDif.hom
### Title: 2D Steady-state radon diffusion in a homogeneous porous medium.
### Aliases: RnDif.hom
### Keywords: RnDif.hom

### ** Examples


#################################################
#####---- Direct input for the function ----#####
#################################################

require(RadTran)

Dif=RnDif.hom(lx=1,ly=3,nx=50,ny=100,e=0.3,m=0.0,rho=2.65e3,bdc_top=1000,
rn_lam=2.09838e-6,rn_ema=10,rn_dif=1.1e-5,rn_sol=0.3565,solution="steady")




