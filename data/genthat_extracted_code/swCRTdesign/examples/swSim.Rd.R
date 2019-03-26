library(swCRTdesign)


### Name: swSim
### Title: Simulating individual-level data for specified study design of
###   Stepped Wedge Cluster Randomized Trial (SW CRT)
### Aliases: swSim
### Keywords: design stepped wedge cluster randomized trial

### ** Examples

library(swCRTdesign)
# Example 1 [ n = scalar; can be vector (for different n for each cluster, 
# n=rep(120,22)) or matrix (different n for each cluster at each time point, 
# n=matrix(120,22,5)) ]

# generate SW data (fractional treatment effect)
design <- swDsn(clusters=c(6,6,6,4), tx.effect=c(0.8,0.9,1.0), extra.time=0, all.ctl.time0=TRUE)
swGenData.nScalar <- swSim( design,
family=binomial(link="logit"), n=120, 
mu0=log(0.1/0.9), mu1=log(0.9) + log(0.1/0.9),
time.effect=c(0,.2,.3,.4,.5)*0, sigma=1, tau=0.2, eta=0, 
rho=0, time.lab=seq(0,12,3), seed=5, retTimeOnTx=FALSE)

# summarize SW data by wave
swSummary(response.var, tx.var, time.var, cluster.var, swGenData.nScalar, 
type="mean", digits=3)$response.wave

swSummary(response.var, tx.var, time.var, cluster.var, swGenData.nScalar, 
type="mean", digits=3)$swDsn




