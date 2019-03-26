library(sppmix)


### Name: GetBDCompfit
### Title: Retrieve parts of a BDMCMC fit
### Aliases: GetBDCompfit

### ** Examples

## No test: 
fit <- est_mix_bdmcmc(pp = spatstat::redwood, m = 7)
GetBDTable(fit)
#retrieve all BDMCMC realizations corresponding to a mixture with 5 components
BDfit5comp=GetBDCompfit(fit,5)
plot(BDfit5comp$BDsurf,main="Mixture intensity surface with 5 components")
#plot with the correct window
plot(BDfit5comp$BDnormmix,xlim =BDfit5comp$BDsurf$window$xrange,ylim =
 BDfit5comp$BDsurf$window$yrange )
plot(BDfit5comp$BDgens)
## End(No test)




