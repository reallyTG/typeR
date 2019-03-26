library(tuts)


### Name: tupoisbsf
### Title: Time uncertain Poisson regression with the Bayesian Frequency
###   Selection method
### Aliases: tupoisbsf

### ** Examples

# Note: Most of models included in tuts package are computationally intensive. In the example
# below I set parameters to meet CRAN’s testing requirement of maximum 5 sec per example.
# A more practical example would contain N=50 in the first line of the code and n.sim=10000.

#1. Import or simulate the data (simulation is chosen for illustrative purposes):
DATA=simtuts(N=7,Harmonics=c(4,0,0), sin.ampl=c(10,0, 0), cos.ampl=c(0,0,0),
            trend=0,y.sd=2, ti.sd=0.2)
y=DATA$observed$y.obs
y=round(y-min(y))
ti.mu=DATA$observed$ti.obs.tnorm
ti.sd= rep(0.2, length(ti.mu))

#2. Fit the model:
n.sim=10
TUPOIS=tupoisbsf(y=y,ti.mu=ti.mu,ti.sd=ti.sd,freqs='internal',n.sim=n.sim,n.chains=2,
                 CV=TRUE,n.cores=2)

#3. Generate summary results (optional parameters are listed in brackets):
summary(TUPOIS)                               # Summary results (CI, burn).
summary(TUPOIS,burn=0.2)                      # Results after 20% of burn-in (CI).

#4. Generate plots and diagnostics of the model (optional parameters are listed in brackets):
plot(TUPOIS,type='periodogram')               # spectral analysis (CI, burn).
plot(TUPOIS,type='predTUTS', CI=0.99)         # One step predictions (CI, burn).
plot(TUPOIS,type='cv')                        # 5 fold cross validation (CI, burn).
plot(TUPOIS,type='GR')                        # Gelman-Rubin diagnostics (CI, burn).
plot(TUPOIS,type='mcmc')                      # MCMC diagnostics.
plot(TUPOIS,type='lambda')                    # Realizaitons of lambda.



