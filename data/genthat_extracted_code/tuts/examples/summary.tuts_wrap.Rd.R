library(tuts)


### Name: summary.tuts_wrap
### Title: Model comaprison of multiple time-uncertain models based on DIC
###   criterion
### Aliases: summary.tuts_wrap

### ** Examples

# Note: Most of models included in tuts package are computationally intensive. In the example
# below I set parameters to meet CRAN’s testing requirement of maximum 5 sec per example.
# A more practical example would contain N=50 in the first line of the code and n.sim=10000.

#1. Import or simulate the data (a simulation is chosen for illustrative purposes):
DATA=simtuts(N=5,Harmonics=c(4,0,0), sin.ampl=c(10,0, 0), cos.ampl=c(0,0,0),
            trend=0,y.sd=2, ti.sd=0.2)
y=DATA$observed$y.obs
ti.mu=DATA$observed$ti.obs.tnorm
ti.sd= rep(0.2, length(ti.mu))

#2. Fit the models:
n.sim=100
WRAP=tuwrap(y=y,ti.mu=ti.mu,ti.sd=ti.sd,n.sim=n.sim)

#3. Generate summary results:
summary(WRAP)




