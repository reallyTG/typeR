library(seacarb)


### Name: carbfull
### Title: Parameters of the seawater carbonate system - extension of carb
### Aliases: carbfull
### Keywords: utilities

### ** Examples


## With a couple of variables
carbfull(flag=8, var1=8.2, var2=0.00234, S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0,
	pHscale="T", kf="pf", k1k2="l", ks="d", b="u74", gas="potential", NH4t=0, HSt=0)

## With a couple of variables and non-zero nutrient concentrations
carbfull(flag=8, var1=8.2, var2=0.00234, S=35, T=25, P=0, Patm=1.0, Pt=5e-6, Sit=2e-6,
	pHscale="T", kf="pf", k1k2="l", ks="d", b="u74", gas="potential", NH4t=10e-6, HSt=0.1e-6)

## Using vectors as arguments
flag <- c(8, 2, 8)
var1 <- c(8.2, 7.477544e-06, 8.2)
var2 <- c(0.002343955, 0.001649802, 2400e-6)
S <- c(35, 35, 30)
T <- c(25, 25, 30)
P <- c(0, 0, 0)
Pt <- c(0, 0, 0)
Sit <- c(0, 0, 0)
kf <- c("pf", "pf", "pf")
k1k2 <- c("l", "l", "l")
pHscale <- c("T", "T", "T")
b <- c("l10", "l10", "l10")
gas <- c("potential", "potential", "potential")
NH4t <- c(0, 0, 0)
HSt <- c(0, 0, 0)
carbfull(flag=flag, var1=var1, var2=var2, S=S, T=T, P=P, Pt=Pt, Sit=Sit, 
  kf=kf, k1k2=k1k2, pHscale=pHscale, b=b, gas=gas, NH4t=NH4t, HSt=HSt)

## Test with all flags 
flag <- c((1:15), (21:25))
var1 <- c(8.200000, 7.308171e-06, 7.308171e-06, 7.308171e-06, 7.308171e-06, 
	8.2, 8.2, 8.2, 8.2, 0.001646857, 0.001646857, 0.001646857, 0.0002822957, 
	0.0002822957, 0.00234, 258.2164, 258.2164, 258.2164, 258.2164, 258.2164 )
var2 <- c(7.308171e-06, 0.001646857, 0.0002822957, 0.00234, 0.001936461, 
	0.001646857, 0.0002822957, 0.00234, 0.001936461, 0.0002822957, 
	0.00234, 0.001936461,  0.00234, 0.001936461, 0.001936461, 8.2, 
	0.001646857, 0.0002822957, 0.00234, 0.001936461)
carbfull(flag=flag, var1=var1, var2=var2)



