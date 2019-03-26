library(sppmix)


### Name: est_MIPPP_cond_mark
### Title: Fit a MIPPP conditionally on mark
### Aliases: est_MIPPP_cond_mark

### ** Examples

## No test: 
#Create a marked point pattern; use randomization and 3 discrete marks
newMPP=rMIPPP_cond_mark( params=c(.2,.5,.3),bigwin = spatstat::owin(c(-10,10),c(-10,10)))
newMPP$params
#supply the true number of components for each ground process
m=c(newMPP$groundsurfs[[1]]$m, newMPP$groundsurfs[[2]]$m, newMPP$groundsurfs[[3]]$m)
MIPPPfit=est_MIPPP_cond_mark(newMPP$genMPP,m=m,compute_surfaces=FALSE)
#check out the mark distribution parameters
#posterior means
MIPPPfit$mark_dist
#credible sets
GetStats(MIPPPfit$gen_mark_ps[,1])$CredibleSet#should contain .2
GetStats(MIPPPfit$gen_mark_ps[,2])$CredibleSet#should contain .5
GetStats(MIPPPfit$gen_mark_ps[,3])$CredibleSet#should contain .3
#now pretend we do not know the truth as is usually the case. Supply an integer
#for m so that the routine will fit a BDMCMC with this as the max number of
#components and use the MAP number of components
MIPPPfit=est_MIPPP_cond_mark(newMPP$genMPP,m=7,compute_surfaces=FALSE)
#check out the mark distribution parameters
MIPPPfit$mark_dist
GetStats(MIPPPfit$gen_mark_ps[,1])$CredibleSet#should contain .2
GetStats(MIPPPfit$gen_mark_ps[,2])$CredibleSet#should contain .5
GetStats(MIPPPfit$gen_mark_ps[,3])$CredibleSet#should contain .3
## End(No test)




