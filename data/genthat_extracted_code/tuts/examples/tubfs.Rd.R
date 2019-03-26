library(tuts)


### Name: tubfs
### Title: Bayesian Frequency Selection of time-uncertain data sets
### Aliases: tubfs

### ** Examples

# Note: Most of models included in tuts package are computationally intensive. In the example
# below I set parameters to meet CRAN’s testing requirement of maximum 5 sec per example.
# A more practical example would contain N=50 in the first line of the code and n.sim=10000.

#1. Import or simulate the data (a simulation is chosen for illustrative purposes):
DATA=simtuts(N=8,Harmonics=c(4,0,0), sin.ampl=c(10,0, 0), cos.ampl=c(0,0,0),
            trend=0,y.sd=2, ti.sd=0.2)
y=DATA$observed$y.obs
ti.mu=DATA$observed$ti.obs.tnorm
ti.sd= rep(0.2, length(ti.mu))

#2. Fit the model:
n.sim=10
BFS=tubfs(y=y,ti.mu=ti.mu,ti.sd=ti.sd,freqs='internal',n.sim=n.sim,n.chains=2,CV=TRUE,n.cores=2)

#3. Generate summary results (optional parameters are listed in brackets):
summary(BFS)                               # Summary results (CI, burn).
summary(BFS,burn=0.2)                      # Results after 20% of burn-in (CI).

#4. Generate plots and diagnostics of the model (optional parameters are listed in brackets):
plot(BFS,type='periodogram')               # spectral analysis (CI, burn).
plot(BFS,type='predTUTS', CI=0.99)         # One step predictions (CI, burn).
plot(BFS,type='cv')                        # 5 fold cross validation plot (CI, burn).
plot(BFS,type='GR')                        # Gelman-Rubin diagnostics (CI, burn).
plot(BFS,type='mcmc')                      # mcmc diagnostics.
plot(BFS,type='volatility')                # Volatility realizaitons.



