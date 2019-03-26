library(joint.Cox)


### Name: jointCox.indep.reg
### Title: Penalized Likelihood Estimation under the Joint Cox Models
###   Between Tumour Progression and Death for Meta-Analysis
### Aliases: jointCox.indep.reg
### Keywords: Estimation Frailty

### ** Examples

############## Reproduce the results of Emura et al. (2015) #############
data(dataOvarian)
t.event=dataOvarian$t.event
event=dataOvarian$event
t.death=dataOvarian$t.death
death=dataOvarian$death
Z1=dataOvarian$CXCL12
group=dataOvarian$group
alpha_given=0
kappa_grid=seq(10,1e+17,length=30)
set.seed(1)
#jointCox.indep.reg(t.event=t.event,event=event,t.death=t.death,death=death,
#                 Z1=Z1,Z2=Z1,group=group,alpha=alpha_given,
#                 kappa1=kappa_grid,kappa2=kappa_grid,LCV.plot=TRUE,Adj=500)




