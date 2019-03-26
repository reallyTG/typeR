library(RadTran)


### Name: RnDifAdv.hom
### Title: 2D Steady-state radon diffusion & advection in a homogeneous
###   column of sand.
### Aliases: RnDifAdv.hom
### Keywords: RnDifAdv.hom

### ** Examples

#################################################
#####---- Direct input for the function ----#####
#################################################

require(RadTran)

AdvDif=RnDifAdv.hom(lx=1,ly=5,nx=50,ny=100,e=0.3,m=0.0,bdc_top=5000,
rn_lam=2.09838e-6,rn_sol=0.3565,k_soil=1e-11,d_bulk=1e-6,miu=17.5e-6,
dp=-100,solution="steady")




