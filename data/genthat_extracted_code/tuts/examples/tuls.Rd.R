library(tuts)


### Name: tuls
### Title: Spectral analysis of time-uncertain time series using
###   Lomb-Scargle method
### Aliases: tuls

### ** Examples

#1. Import or simulate the data (a simulation is chosen for illustrative purposes):
DATA=simtuts(N=50,Harmonics=c(4,0,0), sin.ampl=c(10,0, 0), cos.ampl=c(0,0,0),
            trend=0,y.sd=2, ti.sd=0.2)
y=DATA$observed$y.obs
ti.mu=DATA$observed$ti.obs.tnorm
ti.sd= rep(0.2, length(ti.mu))

#2. Run multiple Lomb-Scargle periodograms (optional parameters are listed in brackets):
TULS=tuls(y=y,ti.mu=ti.mu,ti.sd=ti.sd,n.sim=500)     # (ofac, CI).

#3. Plot the Lomb-Scargle periodograms:
plot(TULS)

#4. Obtain list of frequencies for which spectral power exceeds confidence interval:
summary(TULS)



