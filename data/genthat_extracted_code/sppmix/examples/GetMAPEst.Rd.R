library(sppmix)


### Name: GetMAPEst
### Title: Retrieve the surface of MAP estimators
### Aliases: GetMAPEst

### ** Examples

## No test: 
truemix_surf <- rmixsurf(m = 3, lambda=100, xlim = c(-3,3), ylim = c(-3,3))
plot(truemix_surf,main="True IPPP intensity surface")
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
#the larger the number of realizations the better
fit <- est_mix_damcmc(genPPP, m = 3,L=100000)
MAPest=GetMAPEst(fit)
plot(GetPMEst(fit),main="IPPP intensity surface of posterior means")
plot(MAPest,main="IPPP intensity surface of MAP estimates")
fitBD <- est_mix_bdmcmc(pp = genPPP, m = 5)
MAPest=GetMAPEst(fitBD)
plot(MAPest,main="IPPP intensity surface of MAP estimates for MAP m")
## End(No test)




