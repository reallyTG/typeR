library(sppmix)


### Name: GetKLEst
### Title: Retrieve the surface of Kullback-Leibler (KL) estimators
### Aliases: GetKLEst

### ** Examples

## No test: 
#generate a surface
truemix_surf <- rmixsurf(m = 3, lambda=100, xlim = c(-3,3), ylim = c(-3,3))
plot(truemix_surf,main="True IPPP intensity surface")
#generate a point pattern
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
#fit the IPPP model using DAMCMC
fit = est_mix_damcmc(genPPP, m = 3,L=20000)
#get the surfaces of posterior means, MAP and KL estimates
Meansest=GetPMEst(fit)
MAPest=GetMAPEst(fit)
KLest=GetKLEst(fit)
#plot all fitted surfaces
plot(Meansest,main="IPPP intensity surface of posterior means")
plot(MAPest,main="IPPP intensity surface of MAP estimates")
plot(KLest,main="IPPP intensity surface of KL estimates")
#fix labels (if label switching is detected)
KLestLSFixed=GetKLEst(fit,fixLS=TRUE,approx=FALSE)
plot(KLestLSFixed,main="IPPP intensity surface of KL estimates (LS fixed)")
#compare the four estimates against the truth
CompareSurfs(truemix_surf, Meansest, LL = 100, truncate = FALSE)
CompareSurfs(truemix_surf, MAPest, LL = 100, truncate = FALSE)
CompareSurfs(truemix_surf, KLest, LL = 100, truncate = FALSE)
CompareSurfs(truemix_surf, KLestLSFixed, LL = 100, truncate = FALSE)
## End(No test)




