library(sfsmisc)


### Name: p.profileTraces
### Title: Plot a profile.nls Object With Profile Traces
### Aliases: p.profileTraces
### Keywords: hplot nonlinear

### ** Examples

require(stats)
data(Puromycin)
Treat <- Puromycin[Puromycin$state == "treated", ]
fm <- nls(rate ~ T1*conc/(T2+conc), data=Treat,
          start = list(T1=207,T2=0.06))
(pr <- profile(fm)) # quite a few things..
op <- par(mfcol=1:2)
plot(pr) # -> 2 'standard' plots
par(op)
## ours:
p.profileTraces(pr)



