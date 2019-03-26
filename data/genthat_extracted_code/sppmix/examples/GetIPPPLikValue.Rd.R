library(sppmix)


### Name: GetIPPPLikValue
### Title: Retrieve the IPPP likelihood value
### Aliases: GetIPPPLikValue

### ** Examples

## No test: 
truemix_surf <- rmixsurf(m = 3, lambda=100,xlim = c(-3,3),ylim = c(-3,3))
plot(truemix_surf,main="True IPPP intensity surface")
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
fit <- est_mix_damcmc(genPPP, m = 3)
MAPest=GetMAPEst(fit)
GetIPPPLikValue(genPPP,MAPest)
GetIPPPLikValue(genPPP,GetPMEst(fit))
## End(No test)




