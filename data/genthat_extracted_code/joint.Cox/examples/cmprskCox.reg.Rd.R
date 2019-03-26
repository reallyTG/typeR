library(joint.Cox)


### Name: cmprskCox.reg
### Title: The Competing Risks Version of Penalized Likelihood Estimation
###   under the Joint Cox Models Between Tumour Progression and Death for
###   Meta-Analysis
### Aliases: cmprskCox.reg
### Keywords: Penalized likelihood estimation Cox regression Competing risk
###   Clayton copula

### ** Examples

data(dataOvarian)
t.event=dataOvarian$t.event
t.death=dataOvarian$t.death
event=dataOvarian$event
death=dataOvarian$death
non.event=which(event==1 & death==1 & t.event==t.death)
non.death=which(event==1 & death==1 & t.event<t.death)
event[non.event]=0 ## relapse before death
death[non.death]=0 ## death before relapse (tie is counted as death)
Z1=dataOvarian$CXCL12
group=dataOvarian$group
alpha_given=0
theta=2.35
kappa_grid=seq(10,1e+17,length = 30)

set.seed(1)
#cmprskCox.reg(t.event = t.event,event1 = event,event2 = death,
#              Z1 = Z1,Z2 = Z1,group = group,theta=theta,alpha = alpha_given,
#              kappa1 = kappa_grid,kappa2 = kappa_grid,LCV.plot = TRUE,Adj = 500)



