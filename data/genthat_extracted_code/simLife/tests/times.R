## Simulation of individual failure times,
## test simulating defect accumulation

library(simLife)
data(AL2MC_20p_k10_F2p_S)

## generate individual failure times
opt <- list("vickers"=107,"distTol"=1, "Tmax"=10^11,
		"inAreafactor"=1.56, "outAreafactor"=1.43,
		"pointsConvHull"=10, "scale"=1e+06,"pl"=0)

par <- list("P"=c(0.01,6,0.5,75,-15,3),
		    "F"=c(0,0,0,105,-12,1),"const"=NULL)

## simulate times
stress <- 110
CLT <- simTimes(S,par,vickers=opt$vickers,stress=stress)

(RET <- simDefect(stress,S,CLT,opt))
