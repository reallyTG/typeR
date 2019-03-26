library(RadTran)


### Name: RnDif.het
### Title: 2D Steady-state radon diffusion in a heterogeneous porous
###   medium.
### Aliases: RnDif.het
### Keywords: RnDif.het

### ** Examples

#################################################
#####---- Direct input for the function ----#####
#################################################

###--defining porosity and moisture functions for y-axis profiles--###
###---------------------------examples-----------------------------###

require(RadTran)

#porosity linear decrease until 3m depth
y.poro  =  function(X,Y)
           return(p.lin(Y,x.L=1.0,y.0=0.5,y.inf=0.3,x.att=0))

	
#moisture non-linear decrease until 3m depth, function input is m(z)=-0.4z+2.0
lin.inc  =  function(x,y.0=0,y.inf=0.5,x.L=0,x.att=2) 
            return(1 - p.lin(x,y.0,y.inf,x.L,x.att))
             
y.hum=function(X,Y)
			return(lin.inc(Y,y.0=0.8,y.inf=0))


Dif=RnDif.het(lx=1,ly=3,nx=50,ny=100,rho=2.65e3,x.poro=0.3,
x.hum=0.4,y.poro=y.poro,y.hum=y.hum,bdc_top=1000,rn_lam=2.09838e-6,
rn_ema=10,rn_dif=1.1e-5,rn_sol=0.3565,solution="steady")
			




