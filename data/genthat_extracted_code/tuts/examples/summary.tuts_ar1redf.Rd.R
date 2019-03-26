library(tuts)


### Name: summary.tuts_ar1redf
### Title: Prints summary tables of tuts_ar1redf objects
### Aliases: summary.tuts_ar1redf

### ** Examples

# Note: Most of models included in tuts package are computationally intensive. In the example
# below I set parameters to meet CRAN's testing requirement of maximum 5 sec per example.
# A more practical example would contain N=50 in the first line of the code and n.sim=10000.

#1. Import or simulate the data (a simulation is chosen for illustrative purposes):
DATA=simtuts(N=10,Harmonics=c(4,0,0), sin.ampl=c(10,0, 0), cos.ampl=c(0,0,0),
            trend=0,y.sd=2, ti.sd=0.2)
y=DATA$observed$y.obs
ti.mu=DATA$observed$ti.obs.tnorm
ti.sd= rep(0.2, length(ti.mu))

#2. Fit the model:
n.sim=1000; n.chains=2
AR1REDF=tuar1redf(y=y,ti.mu=ti.mu,ti.sd=ti.sd,n.sim=n.sim,n.chains=n.chains, CV=FALSE)

#3. Generate summary results (optional parameters are listed in brackets):
summary(AR1REDF)                                # Summary results (CI, burn).



