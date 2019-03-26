context('checkMonoEmax')


### continuous with aggregate data

data("examples14")
exdat<-examples14[[6]]

prior<-prior.control(epmu=0,epsd=10,emaxmu=0,emaxsd=10,p50=0.25,
										 sigmalow=0.01,sigmaup=3)
mcmc<-mcmc.control(chains=3)

fitout<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,prot=exdat$prot,
								 count=exdat$nsize,msSat=(exdat$sd)^2,mcmc=mcmc)

parm<-coef(fitout)
sigsim<-sigma(fitout)

p1<-checkMonoEmax(exdat$y,exdat$dose,parm,(sigsim)^2,
									nvec=exdat$nsize,trend='negative')

test_that("continuous model fit is good",{
  expect_gt(p1,0.5)
})

### make high group decline (do not rerun mcmc for altered fit)
ynm<-ifelse(exdat$dose==1,exdat$y+1.5,exdat$y)
set.seed(12357)
p1nm<-checkMonoEmax(ynm,exdat$dose,parm,(sigsim)^2,trend='negative')

test_that("coninuous model fit is bad",{
  expect_lt(p1nm,0.05)
})

##########
#### repeat with individual patient data
set.seed(12357)
popparm<-apply(parm[,1:4],2,median)
popmean<-emaxfun(exdat$dose,popparm)
popmean[6]<-popmean[6]+1.5*exdat$sd   ### ensure positive
dose<-rep(exdat$dose,exdat$nsize)
popmean<-rep(popmean,exdat$nsize)
y<-rnorm(length(popmean),popmean,exdat$sd)


prior<-prior.control(epmu=0,epsd=10,emaxmu=0,emaxsd=10,p50=0.25,
										 sigmalow=0.01,sigmaup=3)
mcmc<-mcmc.control(chains=3)

fitouti<-fitEmaxB(y,dose,prior,modType=4, mcmc=mcmc)

parmi<-coef(fitouti)
sigsimi<-sigma(fitouti)

p1v<-checkMonoEmax(y,dose,parmi,(sigsimi)^2,
									trend='negative')

test_that("individual data continuous model fit is good",{
  expect_gt(p1v,0.5)
})


ynm<-ifelse(dose==1,y+0.75,y)

p1nv<-checkMonoEmax(ynm,dose,parm,(sigsim)^2,
									trend='negative')

test_that("individual data coninuous model fit is bad",{
  expect_lt(p1nv,0.05)
})


##########################################################################
### convert continuous to binary for testing
set.seed(12357)
exdat<-examples14[[8]]
prior<-prior.control(epmu=0,epsd=4,emaxmu=0,emaxsd=4,p50=.15,binary=TRUE)
mcmc<-mcmc.control(chains=3)

fitoutb<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,count=exdat$nsize,
								 mcmc=mcmc,binary=TRUE)

parms<-coef(fitoutb)
popparms<-apply(parms,2,median)

dose<-rep(exdat$dose,exdat$nsize)
modp<-plogis(emaxfun(dose,popparms))
modp[dose==0.4]<-modp[dose==0.4]+.05

yb<-rbinom(length(modp),1,modp)

fitoutb2<-fitEmaxB(yb,dose,prior,modType=4,
								 mcmc=mcmc,binary=TRUE)
parmb<-coef(fitoutb2)

set.seed(12357)
p1b<-checkMonoEmax(yb,dose,parmb,rep(1,nrow(parmb)),trend='negative',binary=TRUE)

test_that("binary model fit is good",{
  expect_gt(p1b,0.2)
})

## non-monotone 
ybnm<-ifelse(dose==1,rbinom(sum(dose==1),1,.3),yb)

set.seed(12357)
p1bnm<-checkMonoEmax(ybnm,dose,parmb,rep(1,nrow(parmb)),trend='negative',binary=TRUE)

test_that("binary model fit is bad",{
  expect_lt(p1bnm,0.05)
})

###########
#### repeat with aggregate data
#### first with weighted averages of means
dvec<-sort(unique(dose))

ybv<-tapply(yb,dose,mean)
ybnmv<-tapply(ybnm,dose,mean)
nvec<-as.vector(table(dose))

set.seed(12357)
p1bv<-checkMonoEmax(ybv,dvec,parmb,rep(1,nrow(parmb)),nvec=nvec,trend='negative',binary=TRUE)

test_that("aggregate good binary model check",{
  expect_equal(p1b,p1bv)
})

set.seed(12357)
p1bnmv<-checkMonoEmax(ybnmv,dvec,parmb,rep(1,nrow(parmb)),nvec=nvec,trend='negative',binary=TRUE)

test_that("aggregate bad coninuous model fit",{
  expect_equal(p1bnm,p1bnmv)
})

### repeat with y as 0/1 counts

yc<-c(rep(1,7),rep(0,7))
dvec<-c(dvec,dvec)
nvec<-rep(0,14)
for(i in 1:7){
	nvec[i]<-sum(yb==1 & dose==dvec[i])	
	nvec[i+7]<-sum(yb==0 & dose==dvec[i])	
}
set.seed(12357)
p1bv0<-checkMonoEmax(yc,dvec,parmb,rep(1,nrow(parmb)),nvec=nvec,trend='negative',binary=TRUE)

test_that("aggregate good coninuous model check alternative form",{
  expect_equal(p1bv,p1bv0)
})

############
### with covariates

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
x1<-matrix(rnorm(3*n1),ncol=3)
x1<-scale(x1,center=TRUE,scale=FALSE)
x2<-matrix(rnorm(3*n2),ncol=3)
x2<-scale(x2,center=TRUE,scale=FALSE)
x<-rbind(x1,x2)
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
bparm<-c(2,-1,0.5)
meanlev<-emaxfun(dose,pop) + x%*%bparm 

y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

basemu<-numeric(3)
basevar<-diag(3)*(10*sdy)^2
prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5,basemu=basemu,basevar=basevar)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout2<-fitEmaxB(y,dose,prior=prior,modType=4,prot=prots,xbase=x,
									 mcmc=mcmc,diagnostics=FALSE)

parms<-coef(testout2)
parms<-parms[,c(1:4,6:8)]
sigsim<-sigma(testout2)

y1<-y[prots==1]
dose1<-dose[prots==1]

p1<-checkMonoEmax(y1,dose1,parms,(sigsim)^2,xbase=x1, trend='positive')

test_that("continuous model fit with covariate is good",{
  expect_gt(p1,0.5)
})

### check lack of fit
y1nm<-y1
y1nm[dose1==350]<-rnorm(sum(dose1==350),5,sdy)

p1nm<-checkMonoEmax(y1nm,dose1,parms,(sigsim)^2,xbase=x1, trend='positive')

test_that("cont model fit with covariate is bad",{
  expect_lt(p1nm,0.05)
})

### binary, covariates
### check with larger n for better asymptotics
### 4-parm model, 2 covariates, 1 protocol

set.seed(20572)

doselev<-c(0,5,25,50,100,350)
n<-2*c(78,81,81,81,77,80)
ntot<-sum(n)

### population parameters for simulation
e0<- -1.5 
ed50<-67.481113 
emax<-4.0
pop<-c(log(ed50),emax,e0)    
dose<-c(rep(doselev,n/2),rep(doselev,n/2))
prot<-sort(rep(1:2,ntot/2))
meanlev<-emaxfun(dose,pop)+0.5*(prot==2)  

x1<-matrix(rnorm(ntot),ncol=2)
x1<-scale(x1,center=TRUE,scale=FALSE)
x2<-matrix(rnorm(ntot),ncol=2)
x2<-scale(x2,center=TRUE,scale=FALSE)
x<-rbind(x1,x2)
bparm<-c(1.,-0.5)
meanlev<-plogis(meanlev + x%*%bparm)

y<-rbinom(ntot,1,meanlev)

basemu<-numeric(2)
basevar<-diag(2); basevar[2,1]<-.25; basevar[1,2]<-.25
basevar<-basevar*(4)^2  ## off-diagonal elements

prior<-prior.control(0,30,0,30,50,edDF=5,basemu=basemu,basevar=basevar,binary=TRUE)
mcmc<-mcmc.control(chains=1,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout5b<-fitEmaxB(y,dose,prot=prot,prior=prior,modType=4,xbase=x,
										mcmc=mcmc,diagnostics=FALSE,binary=TRUE)

parms<-coef(testout5b)
parms<-parms[,c(1:4,6:7)]


y1<-y[prot==1]
dose1<-dose[prot==1]
p1b<-checkMonoEmax(y1,dose1,parms,sigma2=numeric(length(y1)),xbase=x1,binary=TRUE)

test_that("binary model fit with covariate is good",{
  expect_gt(p1,0.25)
})

### check lack of fit
y1nm<-y1
y1nm[dose1==350]<-rbinom(sum(dose1==350),1,0.2)

p1bnm<-checkMonoEmax(y1nm,dose1,parms,(sigsim)^2,xbase=x1, trend='positive',binary=TRUE)

test_that("binary model fit with covariate is bad",{
  expect_lt(p1bnm,0.05)
})
