library(frailtyHL)


### Name: frailtyHL
### Title: Fitting Frailty Models using H-likelihood Approach
### Aliases: frailtyHL

### ** Examples

#### Analysis of kidney data
data(kidney)
#### Normal frailty model using order = 0, 1 for the mean and dispersion
kidney_ln01<-frailtyHL(Surv(time,status)~sex+age+(1|id),kidney,
RandDist="Normal",mord=0,dord=1)
#### Normal frailty model using order = 1, 1 for the mean and dispersion
#kidney_ln11<-frailtyHL(Surv(time,status)~sex+age+(1|id),kidney,
#RandDist="Normal",mord=1,dord=1)
#### Gamma frailty model using order = 0, 2 for the mean and dispersion
#kidney_g02<-frailtyHL(Surv(time,status)~sex+age+(1|id),kidney,
#RandDist="Gamma",mord=0,dord=2)
#### Gamma frailty model using order = 1, 2 for the mean and dispersion
#kidney_g12<-frailtyHL(Surv(time,status)~sex+age+(1|id),kidney,
#RandDist="Gamma",mord=1,dord=2)

#### Analysis of rats data
data(rats)
#### Cox model
rat_cox<-frailtyHL(Surv(time,status)~rx+(1|litter),rats,
varfixed=TRUE,varinit=c(0))
#### Normal frailty model using order = 1, 1 for the mean and dispersion
#rat_ln11<-frailtyHL(Surv(time,status)~rx+(1|litter),rats,
#RandDist="Normal",mord=1,dord=1,varinit=c(0.9))
#### Gamma frailty model using order = 1, 2 for the mean and dispersion
#rat_g12<-frailtyHL(Surv(time,status)~rx+(1|litter),rats,
#RandDist="Gamma",mord=1,dord=2,convergence=10^-4,varinit=c(0.9))

#### Analysis of CGD data
data(cgd)
#### Multilevel normal frailty model using order = 1, 1 for the mean and dispersion
#cgd_ln11<-frailtyHL(Surv(tstop-tstart,status)~treat+(1|center)+(1|id),cgd,
#RandDist="Normal",mord=1,dord=1,convergence=10^-4,varinit=c(0.03,1.0))



