library(kin.cohort)


### Name: simulations
### Title: simulation of kin cohort studies
### Aliases: kc.simul sample.caco summary.kin.cohort.sample
### Keywords: survival methods

### ** Examples

## Not run: 
##D set.seed(7)
##D ## cohort 
##D s<-kc.simul(4000, f=0.03, hr=5)
##D summary(s)
##D 
##D ## exclude probands
##D m.coh<- kc.marginal(s$agecancer, s$cancer, factor(s$carrier), s$rel,
##D                     knots=c(30,40,50,60,70,80,90), f=0.03)
##D m.coh
##D 
##D ## relatives only
##D r.coh<- coxph(Surv(agecancer,cancer)~real.carrier, data=s)
##D print(exp(coef(r.coh)))
##D 
##D ## probands only
##D p.coh<- coxph(Surv(agecancer,cancer)~carrier, data=s)
##D print(exp(coef(p.coh)))
##D 
##D ## case-control
##D s.cc<- sample.caco(s)
##D summary(s.cc)
##D 
##D ## exclude probands
##D m.caco<- kc.marginal(s.cc$agecancer, s.cc$cancer, factor(s.cc$carrier), 
##D                      s.cc$rel, knots=c(30,40,50,60,70,80,90), f=0.03)
##D m.caco
##D 
##D ## relatives only
##D r.caco<- glm(cancer~real.carrier, family=binomial, data=s.cc, subset=(s.cc$rel!=0))
##D print(exp(coef(r.caco)[2]))
##D 
##D ## probands only
##D p.caco<- glm(cancer~carrier, family=binomial, data=s.cc, subset=(s.cc$rel==0))
##D print(exp(coef(p.caco)[2]))
## End(Not run)



