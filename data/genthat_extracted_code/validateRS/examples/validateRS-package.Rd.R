library(validateRS)


### Name: validateRS-package
### Title: Multiple testing procedures for validation of rating systems.
### Aliases: validateRS-package validateRS

### ** Examples

## Not run: 
##D data(ratingData)
##D rc.selected<-1:5
##D si.selected<-1:2
##D p.0<-ratingData$p.0[rc.selected]
##D sizes<-ratingData$sizes[si.selected,rc.selected]
##D 
##D # ===============================================
##D # compute alternative hypothesis H1A
##D # ===============================================
##D H1A<-power.target.Nclasses(p.0=p.0, size=sizes[1,], 
##D                            N=length(p.0), 
##D                            target=0.50)
##D 
##D # compute minP's region and its power under H1A (the latter must be close to 0.5)
##D r.mp<-region.acceptance(hypo.test="minP", p.0=p.0, size=sizes[1,], alpha=0.05)
##D region.power(region=r.mp, p.1=H1A[1,])
##D 
##D # compute enhanced test's region and its power under H1A 
##D # (result in table 4 of the ECB Working paper)
##D r.mpp<-region.acceptance(hypo.test="minPp", p.0=p.0, size=sizes[1,], alpha=0.05)
##D region.power(region=r.mpp, p.1=H1A[1,])
##D 
##D # compute envelope test's region and its power under H1A 
##D # (result in table 4 of the ECB Working paper)
##D r.sh<-region.acceptance(hypo.test="sterneHull", p.0=p.0, size=sizes[1,], alpha=0.05)
##D region.power(region=r.sh, p.1=H1A[1,])
##D 
##D # ===============================================
##D # compute alternative hypothesis H1B
##D # ===============================================
##D H1B<-power.target.Nclasses(p.0=p.0, size=sizes[1,], 
##D                            N=1, 
##D                            target=0.30)
##D 
##D # compute minP's region and its power under H1B (the latter must be close to 0.3)
##D r.mp<-region.acceptance(hypo.test="minP", p.0=p.0, size=sizes[1,], alpha=0.05)
##D power.vec<-vector(mode="numeric", length=nrow(H1B))
##D for ( i in 1:nrow(H1B) ) {
##D   power.vec[i]<-region.power(region=r.mp, p.1=H1B[i,])
##D }
##D cat(paste("mean :", mean(power.vec), "\n"))
##D 
##D # compute enhanced test's region and its power under H1B 
##D # (result in table 4 of the ECB Working paper)
##D r.mpp<-region.acceptance(hypo.test="minPp", p.0=p.0, size=sizes[1,], alpha=0.05)
##D power.vec<-vector(mode="numeric", length=nrow(H1B))
##D for ( i in 1:nrow(H1B) ) {
##D   power.vec[i]<-region.power(region=r.mpp, p.1=H1B[i,])
##D }
##D cat(paste("mean :", mean(power.vec), "\n"))
##D 
##D # compute envelope test's region and its power under H1B 
##D # (result in table 4 of the ECB Working paper)
##D r.sh<-region.acceptance(hypo.test="sterneHull", p.0=p.0, size=sizes[1,], alpha=0.05)
##D power.vec<-vector(mode="numeric", length=nrow(H1B))
##D for ( i in 1:nrow(H1B) ) {
##D   power.vec[i]<-region.power(region=r.sh, p.1=H1B[i,])
##D }
##D cat(paste("mean :", mean(power.vec), "\n"))
##D 
##D 
##D # ===============================================
##D # compute alternative hypothesis H1C
##D # ===============================================
##D param<-par.dist.default(dist="tr.normal", p.0=p.0)
##D set.seed(1)
##D sample.h1<-sample.knowledge.H1(n=10000, par=param, p.0=p.0)
##D 
##D sim.mp<-simul.scenario.rs(hypo.test="minP", p.0=p.0, sampleH1=sample.h1, sizes=sizes, alpha=0.05)
##D sim.mp$power$weighted.average
##D 
##D sim.mpp<-simul.scenario.rs(hypo.test="minPp", p.0=p.0, sampleH1=sample.h1, sizes=sizes, alpha=0.05)
##D sim.mpp$power$weighted.average
## End(Not run)



