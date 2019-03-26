library(perturb)


### Name: perturb
### Title: Perturbation analysis to evaluate collinearity
### Aliases: perturb summary.perturb print.summary.perturb
### Keywords: regression

### ** Examples

library(car)
data(Duncan)
attach(Duncan)
m1<-lm(prestige~income+education)
summary(m1)
anova(m1)
vif(m1)
p1<-perturb(m1,pvars=c("income","education"),prange=c(1,1))
summary(p1)
m2<-lm(prestige~income+education+type)
summary(m2)
anova(m2)
vif(m2)
p2<-perturb(m2,pvars=c("income","education"),prange=c(1,1),pfac=list("type",pcnt=95))
summary(p2)

## Not run: 
##D r1<-lm(ses~fegp6+educyr+eyr+exp2)
##D summary(r1)
##D q<-perturb(r1,c("eyr","exp"),c(2.5,2.5),ptrans="exp2<-exp^2")
##D summary(q)
##D 
##D fegp6<-as.factor(fegp6)
##D 
##D # eyr and exp also as factors
##D eyrc<-cut(eyr,c(min(eyr),40,50,60,70,80,max(eyr)),include.lowest=T,right=F)
##D table(eyrc)
##D expc<-cut(exp,c(0,10,20,max(exp)),include.lowest=T,right=F)
##D table(expc)
##D 
##D # rough initial reclassification probabilities,
##D # program will ensure they sum to 100 row-wise
##D m1<-matrix(0,nlevels(eyrc),nlevels(eyrc))
##D m1[row(m1)==col(m1)]<-80
##D m1[abs(row(m1)-col(m1))==1]<-8
##D m1[abs(row(m1)-col(m1))==2]<-2
##D m1
##D 
##D m2<-matrix(0,nlevels(expc),nlevels(expc))
##D m2[row(m2)==col(m2)]<-80
##D m2[abs(row(m2)-col(m2))==1]<-10
##D m2[abs(row(m2)-col(m2))==2]<-2
##D m2
##D 
##D r2<-lm(ses~fegp6+eyrc+expc)
##D summary(r2)
##D pfac=list(list("fegp6",pcnt=95),list("eyrc",pcnt=m1),list("expc",pcnt=m2))
##D q2<-perturb(r2,pfac=pfac,niter=1)
##D summary(q2)
## End(Not run)



