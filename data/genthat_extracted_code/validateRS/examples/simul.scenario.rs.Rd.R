library(validateRS)


### Name: simul.scenario.rs
### Title: Determine cardinality and power for a statistical test.
### Aliases: simul.scenario.rs

### ** Examples

p.0<-c(0.001, 0.004)
sizes<-rbind( c(500, 500), 
              c(1000, 5000))
alpha<-0.05
## Not run: 
##D s.nrm<-sample.knowledge.H1(n=10, 
##D                         par=par.dist.default(dist="tr.normal", p.0=c(0.001, 0.004)))
##D scen.nrm.mp<-simul.scenario.rs(hypo.test="minP", p.0=p.0, 
##D                         sampleH1=s.nrm, sizes=sizes, alpha=alpha)
##D scen.nrm.mpp<-simul.scenario.rs(hypo.test="minPp", p.0=p.0, 
##D                         sampleH1=s.nrm, sizes=sizes, alpha=alpha)
##D 
##D par.ownsample<-par.dist.default(dist="usersupplied", p.0=c(0.001, 0.004))
##D par.ownsample$param<-rbind(c(0.001, 0.01), c(0.004, 0.004), c(0.004, 0.01))
##D s.own<-sample.knowledge.H1(n=10, 
##D                         par=par.ownsample)
##D 
##D scen.ownsample.mp<-simul.scenario.rs(hypo.test="minP", p.0=p.0, 
##D                         sampleH1=s.own, sizes=sizes, alpha=alpha)
## End(Not run)



