library(sppmix)


### Name: CompareSurfs
### Title: Quantify the difference between two surfaces
### Aliases: CompareSurfs

### ** Examples

## No test: 
#compare two surfaces first
mixsurf1 = rmixsurf(m = 5, sig0 = .1, df = 5,xlim= c(-1,4), ylim = c(-2,1), rand_m = FALSE)
mixsurf2 = rmixsurf(m = 8, sig0 = .1, df = 5,xlim= c(-4,3), ylim = c(-1,2), rand_m = FALSE)
comp=CompareSurfs(mixsurf1,mixsurf2)
plot(mixsurf1,main = "First IPPP",win=comp$win)
plot(mixsurf2,main = "Second IPPP",win=comp$win)
# now we compare intensity surfaces and image objects that represent intensity surfaces
truemixsurf = rmixsurf(m = 5,xlim= c(-2,2), ylim = c(-2,2))
plot(truemixsurf,main="True IPPP surface")
#get a point pattern
genpp = rsppmix(truemixsurf,truncate=FALSE)
# Run BDMCMC and get posterior realizations
postfit=est_mix_bdmcmc(genpp,m=10,L=30000)
postfit=drop_realization(postfit,.1*postfit$L) #apply burnin
BMA=GetBMA(postfit,burnin=0)
title1 = paste("Bayesian model average of",postfit$L,"posterior realizations")
plotmix_3d(BMA,title1=title1)
comp=CompareSurfs(truemixsurf,BMA,LL=100)
#We compare the average surface and the truth for many cases below. If we pass images, we
#make sure it has the same dimensions or we force it to the same value by setting LL=100.
#We retrieve the average surfaces corresponding to MAP-1, MAP and MAP+1 components and
#compare them against the truth.
#First retrieve the frequency table and MAP estimate for number of components
BDtab=GetBDTable(postfit)
BDtab
MAPm=BDtab$MAPcomp
BDfitMAPcomp_minus1=GetBDCompfit(postfit,MAPm-1,burnin=0)
avgsurfMAPcomp_minus1=plot_avgsurf(BDfitMAPcomp_minus1$BDgens, LL = 100,burnin=0)
comp=CompareSurfs(truemixsurf,avgsurfMAPcomp_minus1,LL=100)
BDfitMAPcomp=GetBDCompfit(postfit,MAPm,burnin=0)
avgsurfMAPcomp=plot_avgsurf(BDfitMAPcomp$BDgens, LL = 100,burnin=0)
comp=CompareSurfs(truemixsurf,avgsurfMAPcomp,LL=100)
BDfitMAPcomp_plus1=GetBDCompfit(postfit,MAPm+1,burnin=0)
avgsurfMAPcomp_plus1=plot_avgsurf(BDfitMAPcomp_plus1$BDgens, LL = 100,burnin=0)
comp=CompareSurfs(truemixsurf,avgsurfMAPcomp_plus1,LL=100)
## End(No test)




