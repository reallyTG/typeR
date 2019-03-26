library(RadTran)


### Name: SoilAdv.hom
### Title: 2D Steady-state soil gas advection (Darcy Flow) in a homogeneous
###   column of sand.
### Aliases: SoilAdv.hom
### Keywords: SoilAdv.hom

### ** Examples

#################################################
#####---- Direct input for the function ----#####
#################################################

require(RadTran)

Adv2D=SoilAdv.hom(lx=1,ly=3,nx=50,ny=100,e=0.1,k_soil=2e-10,miu=17.5e-6,
dp_bot=0,dp_top=-3,solution="steady")




