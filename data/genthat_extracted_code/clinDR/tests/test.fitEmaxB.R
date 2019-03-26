context('fitEmaxB')

### stan parallel options
options(mc.cores = parallel::detectCores())


### continuous
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
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  


y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout<-fitEmaxB(y,dose,prior=prior,modType=4,prot=prots,
									mcmc=mcmc,diagnostics=FALSE)

parms<-coef(testout)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],1,pop[2:3],pop[3]))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout,dosevec=c(20,80),int=2)

poppred<-emaxfun(c(20,80),pop[c(1:3)])
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-e0))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(70),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-e0),tol=2*sdy/sqrt(70),scale=1))
})

##########################################################
### check aggregated, with larger n for better asymptotics

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-5*c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  


y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

ymean<-tapply(y,list(dose,prots),mean)
ymean<-ymean[!is.na(ymean)]
msSat<-(summary(lm(y~factor(dose)))$sigma)^2
protshort<-c(rep(1,6),rep(2,4))
nag<-table(dose,prots)
nag<-as.vector(nag[nag>0])


prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout<-fitEmaxB(ymean,doselev,prior=prior,modType=4,
									prot=protshort,count=nag,msSat=msSat,
									mcmc=mcmc,diagnostics=FALSE)

parms<-coef(testout)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],1,pop[2:3],pop[3]))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout,dosevec=c(20,80),int=2)

poppred<-emaxfun(c(20,80),pop[c(1:3)])
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-e0))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(70),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-e0),tol=2*sdy/sqrt(70),scale=1))
})

###############################################################
###############################################################
#### repeat with 3 parm 
#### no intercept
####
set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-10*c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-0
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  


y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

ysub<-y[dose!=0]
dsub<-dose[dose!=0]
protsub<-prots[dose!=0]

prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)


testout<-fitEmaxB(ysub,dsub,prior,modType=3,prot=protsub,pboAdj=TRUE,
									mcmc=mcmc,diagnostics=FALSE,nproc=3)

parms<-coef(testout)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-pop[1:2])/se

### check parameter estimates
test_that("pboadj model parameters agree within 2se",{
	expect_lt(as.numeric(max(abs(z))),2.0)
})

### check predictions
predout<-predict(testout,dosevec=c(20,80),int=2)

poppred<-emaxfun(c(20,80),pop)-emaxfun(0,pop)

z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-e0))/predout$sedif


test_that("pboadj predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("pboadj check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(700),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-e0),tol=2*sdy/sqrt(70),scale=1))
})


###############################################################
#### no intercept with 4 parm, non-zero reference group
#### large sample sizes, grouped

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-100*c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-0
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  


y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

ysub<-y[dose!=0]
dsub<-dose[dose!=0]
protsub<-prots[dose!=0]

prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)



ymean<-tapply(ysub,list(dsub,protsub),mean)
ymean<-ymean[!is.na(ymean)]
msSat<-(summary(lm(y~factor(dose)))$sigma)^2
protshort<-c(rep(1,5),rep(2,3))
nag<-table(dsub,protsub)
nag<-as.vector(nag[nag>0])
dlevsub<-doselev[doselev!=0]

testout<-fitEmaxB(ymean,dlevsub,prior,modType=4,prot=protshort,
									count=nag,pboAdj=TRUE,msSat=msSat,
									mcmc=mcmc,diagnostics=FALSE)

parms<-coef(testout)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],1,pop[2]))/se

### check parameter estimates
test_that("pboadj4 model parameters agree within 2se",{
	expect_lt(as.numeric(max(abs(z))),2.0)
})

### check predictions
predout<-predict(testout,dosevec=c(20,80),int=1,dref=50)

poppred<-emaxfun(c(20,80),c(pop[1],1,pop[2],0))
popref<-emaxfun(50,c(pop[1],1,pop[2],0))

z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-popref))/predout$sedif

### check predictions 
test_that("pboadj4 predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("pboadj4 check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(700),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-popref),tol=2*sdy/sqrt(70),scale=1))
})


#############################################################
#############################################################
### 4 parm model and grouped data, one protocol
### and replicated measurement per dose/protocol condition
set.seed(12357)
nsim<-1000
doselev<-c(0,5,25,50,100,350)
n<-20*c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-1
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  
poppred<-emaxfun(c(20,80),pop)
popref<-emaxfun(50,pop)


modtype<-4
if(modtype==4){pparm<-c(pop[1],1,pop[2:3])
}else pparm<-pop
z<-matrix(numeric(modtype*nsim),ncol=modtype)
zabs<-matrix(numeric(nsim*2),ncol=2)
zdif<-matrix(numeric(nsim*2),ncol=2)
prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=1,warmup=500,iter=5000,seed=53453,propInit=0.15,adapt_delta = .9)
estan<-selEstan()

for(i in 1:nsim){
	y<-rnorm(n1+n2,meanlev,sdy)
	prots<-c(rep(1,n1),rep(2,n2))
	### by dose
	ysum<-tapply(y,dose,mean)
	nsum<-as.numeric(table(dose))
	msSat<-tapply(y,dose,var)
	msSat<-sum((nsum-1)*msSat)/(sum(nsum)-length(nsum))
	### by dose/prots
	ysum<-c(tapply(y[prots==1],dose[prots==1],mean),
					tapply(y[prots==2],dose[prots==2],mean))
	
	testout<-fitEmaxB(ysum,doselev,prior=prior,count=n,modType=modtype,
										msSat=msSat,mcmc=mcmc,estan=estan,diagnostics=FALSE)
	
	parms<-coef(testout)
	estimate<-apply(parms,2,mean)
	se<-sqrt(diag(var(parms)))
	z[i,]<-(estimate-pparm)/se
	predout<-predict(testout,dosevec=c(20,80),int=1,dref=50)
	zabs[i,]<-(predout$pred-poppred)/predout$se
	zdif[i,]<-(predout$fitdif-(poppred-popref))/predout$sedif
}
### check parameter estimates
test_that("grouped data model parameters agree within 2se",{
	expect_that(0.05,
							equals(as.numeric(max(apply(abs(z)>1.96,2,mean))),
										 tolerance=3*sqrt(.05*.95/nsim),scale=1))
})

test_that("predictions agree within 3se",{
	expect_that(0.05,
							equals(as.numeric(max(apply(abs(zabs)>1.96,2,mean))),
										 tolerance=3*sqrt(.05*.95/nsim),scale=1))
})
test_that("dif predictions agree within 2se",{
	expect_that(0.05,
							equals(as.numeric(max(apply(abs(zdif)>1.96,2,mean))),
										 tolerance=2*sqrt(.05*.95/nsim),scale=1))
})

#########################################################################
#########################################################################
#########################################################################
##### binary


set.seed(12357)

modType<-4
dvec1<-c(0,.1,.3,.6,1)
dvec2<-c(0,.1,.2,.4,.6,1)
nd1<-length(dvec1)
nd2<-length(dvec2)
n1<-rep(10000,nd1)
n2<-rep(10000,nd2)

parms<-c(log(0.25),1,1.4,-0.5,-0.85)

mlev1<-plogis(emaxfun(dvec1,parms[1:4]))
mlev2<-plogis(emaxfun(dvec2,parms[c(1:3,5)]))

y1<-rbinom(nd1,n1,mlev1)
y2<-rbinom(nd2,n2,mlev2)

### fitEmax inputs
y<-c(rep(1,nd1),rep(0,nd1),rep(1,nd2),rep(0,nd2))
counts<-c(y1,n1-y1,y2,n2-y2)
prots<-c(rep(1,2*nd1),rep(2,2*nd2))
dvec<-c(dvec1,dvec1,dvec2,dvec2)

prior<-prior.control(0,4,0,4,.5,edDF=5,binary=TRUE)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)


testout<-fitEmaxB(y,dvec,modType=modType,
									prot=prots,
									count=counts,binary=TRUE,
									prior=prior,mcmc=mcmc,	
									diagnostics=FALSE)

pgen<-coef(testout)
estimate<-apply(pgen,2,mean)
se<-sqrt(diag(var(pgen)))
z<-(estimate-parms)/se

### check parameter estimates
test_that("model parameters agree within 2se",{
	expect_lt(as.numeric(max(abs(z))),2.0)
})

### check predictions
predout<-predict(testout,dosevec=c(.25,.75),int=2)

poppred<-plogis(emaxfun(c(.25,.75),parms[c(1:3,5)]))
popref<-plogis(emaxfun(0,parms[c(1:3,5)]))
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-popref))/predout$sedif

### check predictions 
test_that("predictions agree within 2se",{
	expect_lt(as.numeric(max(abs(z))),2.0)
	expect_lt(as.numeric(max(abs(zdif))),2.0)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*.5/sqrt(10000),scale=1))
})

#########################################################################
#########################################################################
#### repeat for 3 parm use first prot
set.seed(12357)

modType<-3
dvec1<-c(0,.1,.3,.6,1)
dvec2<-c(0,.1,.2,.4,.6,1)
nd1<-length(dvec1)
nd2<-length(dvec2)
n1<-rep(10000,nd1)
n2<-rep(10000,nd2)

parms<-c(log(0.25),1,1.4,-0.5,-0.85)

mlev1<-plogis(emaxfun(dvec1,parms[1:4]))
mlev2<-plogis(emaxfun(dvec2,parms[c(1:3,5)]))

y1<-rbinom(nd1,n1,mlev1)
y2<-rbinom(nd2,n2,mlev2)

### fitEmax inputs
y<-c(rep(1,nd1),rep(0,nd1),rep(1,nd2),rep(0,nd2))
counts<-c(y1,n1-y1,y2,n2-y2)
prots<-c(rep(1,2*nd1),rep(2,2*nd2))
dvec<-c(dvec1,dvec1,dvec2,dvec2)

prior<-prior.control(0,4,0,4,.5,edDF=5,binary=TRUE)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)


testout<-fitEmaxB(y,dvec,modType=modType,
									prot=prots,
									count=counts,binary=TRUE,
									prior=prior,mcmc=mcmc,	
									diagnostics=FALSE)

pgen<-coef(testout)
estimate<-apply(pgen,2,mean)
se<-sqrt(diag(var(pgen)))
z<-(estimate[1:3]-parms[c(1,3,4)])/se[1:3]

### check parameter estimates
test_that("model parameters agree within 2se",{
	expect_lt(as.numeric(max(abs(z))),2.0)
})

### check predictions
predout<-predict(testout,dosevec=c(.25,.75),int=1)

poppred<-plogis(emaxfun(c(.25,.75),parms[c(1,3,4)]))
popref<-plogis(emaxfun(0,parms[c(1,3,4)]))
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-popref))/predout$sedif

### check predictions 
test_that("predictions agree within 2se",{
	expect_lt(as.numeric(max(abs(z))),2.0)
	expect_lt(as.numeric(max(abs(zdif))),2.0)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*.5/sqrt(10000),scale=1))
})



#######################################################
###### check CI and prediction intervals from plot.fitEmaxB
######

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
nd<-length(doselev)
n<-10*c(78,81,81,81,77,80)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop.parm<-c(log(ed50),emax,e0)    

modTYpe<-4
prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=1,warmup=500,iter=5000,seed=53453,propInit=0.15,adapt_delta = .9)
estan<-selEstan()

dose<-rep(doselev,n)
meanlev<-emaxfun(doselev,pop.parm)  
meanrep<-emaxfun(dose,pop.parm)  
clev<-0.9
nsim<-1000
covci<-matrix(logical(nsim*nd),ncol=nd)
covpi<-matrix(logical(nsim*nd),ncol=nd)
covdifci<-matrix(logical(nsim*nd),ncol=nd)
covdifpi<-matrix(logical(nsim*nd),ncol=nd)
for (i in 1:nsim){
	y<-rnorm(sum(n),meanrep,sdy)
	ymean<-tapply(y,dose,mean)
	msSat<-(summary(lm(y~factor(dose)))$sigma)^2
	testout<-fitEmaxB(ymean,doselev,prior=prior,modType=modType,count=n,
										mcmc=mcmc,msSat=msSat,
										estan=estan,diagnostics = FALSE)
	if(is.null(testout)){
		covci[i,]<-NA
		covpi[i,]<-NA
		covdifci[i,]<-NA
		covdifpi[i,]<-NA   
	}else{
		intout<-plot(testout,clev=clev,plot=FALSE)$plotdata
		covci[i,]<-meanlev>=intout[,'cil'] & meanlev<=intout[,'cih']
		### coverage for independent sample means from the same design
		y<-rnorm(sum(n),meanrep,sdy)
		ym<-tapply(y,dose,mean)
		covpi[i,]<-ym>=intout[,'pil'] & ym<=intout[,'pih']  
		### difference with pbo
		intout<-plot(testout,clev=clev,plot=FALSE,plotDif=TRUE)$plotdata
		covdifci[i,]<-meanlev-meanlev[1]>=intout[,'cil'] & meanlev-meanlev[1]<=intout[,'cih']
		### coverage for independent sample means from the same design
		ym<-ym-ym[1]
		covdifpi[i,]<-ym>=intout[,'pil'] & ym<=intout[,'pih']   
	}
}

test_that("plot.fitEmax CI for continuous data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covci,2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})
test_that("plot.fitEmax PI for continuous data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covpi,2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})


test_that("plot.fitEmax CI DIF for continuous data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covdifci[,-1],2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})
test_that("plot.fitEmax PI DIF for continuous data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covdifpi[,-1],2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})

#####################################
### repeat with binary data
set.seed(12357)

doselev<-c(0,5,25,50,100,350)
nd<-length(doselev)
n<-10*c(78,81,81,81,77,80)

### population parameters for simulation
e0<-qlogis(.2) 
ed50<-67.481113 
emax<-qlogis(.95)
pop.parm<-c(log(ed50),emax,e0)    
meanlev<-plogis(emaxfun(doselev,pop.parm))
y01<-c(rep(1,length(meanlev)),rep(0,length(meanlev)))
d01<-c(doselev,doselev)
clev<-0.9
nsim<-1000
covci<-matrix(logical(nsim*nd),ncol=nd)
covpi<-matrix(logical(nsim*nd),ncol=nd)
covdifci<-matrix(logical(nsim*nd),ncol=nd)
covdifpi<-matrix(logical(nsim*nd),ncol=nd)

modType<-4
prior<-prior.control(0,4,0,4,50,edDF=5,binary=TRUE)
mcmc<-mcmc.control(chains=1,warmup=500,iter=5000,seed=53453,propInit=0.15,adapt_delta = .9)
estan<-selEstan()

for (i in 1:nsim){
	y<-rbinom(length(n),n,meanlev)
	n01<-c(y,n-y)
	testout<-fitEmaxB(y01,d01,prior,modType=4,
										count=n01,diagnostics = FALSE,binary=TRUE)
	if(is.null(testout)){
		covci[i,]<-NA
		covpi[i,]<-NA
		covdifci[i,]<-NA
		covdifpi[i,]<-NA   
	}else{
		intout<-plot(testout,clev=clev,plot=FALSE)$plotdata
		covci[i,]<-meanlev>=intout[,'cil'] & meanlev<=intout[,'cih']
		### coverage for independent sample means from the same design
		
		ypred<-rbinom(length(n),n,meanlev)
		ym<-ypred/n
		covpi[i,]<-ym>=intout[,'pil'] & ym<=intout[,'pih']  
		### difference with pbo
		intout<-plot(testout,clev=clev,plot=FALSE,plotDif=TRUE)$plotdata
		covdifci[i,]<-meanlev-meanlev[1]>=intout[,'cil'] & meanlev-meanlev[1]<=intout[,'cih']
		### coverage for independent sample means from the same design
		ym<-ym-ym[1]
		covdifpi[i,]<-ym>=intout[,'pil'] & ym<=intout[,'pih']   
	}
}

test_that("plot.fitEmax CI for binary data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covci,2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})
test_that("plot.fitEmax PI for binary data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covpi,2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})


test_that("plot.fitEmax CI DIF for binary data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covdifci[,-1],2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})
test_that("plot.fitEmax PI DIF for binary data agree within 3se",{
	expect_that(clev,
							equals(as.numeric(max(apply(covdifpi[,-1],2,mean,na.rm=TRUE))),
										 tolerance=3*sqrt(.1*.9/nsim),scale=1))
})

#################################################################################
#################################################################################
#### include covariates
#################################################################################

## 1 covariate, 2 protocols
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
x1<-rnorm(n1)
x1<-x1-mean(x1)
x2<-rnorm(n2)
x2<-x2-mean(x2)
x<-matrix(c(x1,x2),ncol=1)
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
bparm<-1
meanlev<-emaxfun(dose,pop) + x%*%bparm 

y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

basemu<-0
basevar<-matrix((10*sdy)^2,nrow=1,ncol=1)
prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5,basemu=basemu,basevar=basevar)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout<-fitEmaxB(y,dose,prior=prior,modType=4,prot=prots,xbase=x,
									mcmc=mcmc,diagnostics=FALSE)

parms<-coef(testout)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],1,pop[2:3],pop[3],bparm))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout,dosevec=c(20,80),int=2)

poppred<-emaxfun(c(20,80),pop[c(1:3)])
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-e0))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(70),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-e0),tol=2*sdy/sqrt(70),scale=1))
})

#############################################################
## 3 covariates, 2 protocols
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
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],1,pop[2:3],pop[3],bparm))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout2,dosevec=c(20,80),int=2)

poppred<-emaxfun(c(20,80),pop[c(1:3)])
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-e0))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(70),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-e0),tol=2*sdy/sqrt(70),scale=1))
})

##########################################################
### check with larger n for better asymptotics
### 3-parm model, 2 covariates, 1 protocol

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-5*c(78,81,81,81,77,80)
ntot<-sum(n)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  

x<-matrix(rnorm(2*ntot),ncol=2)
x<-scale(x,center=TRUE,scale=FALSE)
bparm<-c(2,-1)
meanlev<-meanlev + x%*%bparm 

y<-rnorm(ntot,meanlev,sdy)

basemu<-numeric(2)
basevar<-diag(2)*(10*sdy)^2
prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5,basemu=basemu,basevar=basevar)
mcmc<-mcmc.control(chains=1,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout3<-fitEmaxB(y,dose,prior=prior,modType=3,xbase=x,
									mcmc=mcmc,diagnostics=FALSE)

parms<-coef(testout3)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],pop[2:3],bparm))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout3,dosevec=c(20,80),int=1)

poppred<-emaxfun(c(20,80),pop[c(1:3)])
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-e0))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=2*sdy/sqrt(70),scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-e0),tol=2*sdy/sqrt(70),scale=1))
})

##########################################################
### binary, covariates
### check with larger n for better asymptotics
### 4-parm model, 2 covariates, 1 protocol

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-5*c(78,81,81,81,77,80)
ntot<-sum(n)

### population parameters for simulation
e0<- -1.5 
ed50<-67.481113 
emax<-4.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  

x<-matrix(rnorm(2*ntot),ncol=2)
x<-scale(x,center=TRUE,scale=FALSE)
bparm<-c(2,-1)
meanlev<-plogis(meanlev + x%*%bparm)

y<-rbinom(ntot,1,meanlev)

basemu<-numeric(2)
basevar<-diag(2)*(4)^2
prior<-prior.control(0,30,0,30,50,edDF=5,basemu=basemu,basevar=basevar,binary=TRUE)
mcmc<-mcmc.control(chains=1,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout4b<-fitEmaxB(y,dose,prior=prior,modType=4,xbase=x,
									mcmc=mcmc,diagnostics=FALSE,binary=TRUE)

parms<-coef(testout4b)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],1,pop[2:3],bparm))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout4b,dosevec=c(20,80),int=1,xvec=c(0,0))

poppred<-plogis(emaxfun(c(20,80),pop[c(1:3)]))
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-plogis(e0)))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=0.05,scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-plogis(e0)),tol=0.05,scale=1))
})

### binary, covariates
### check with larger n for better asymptotics
### 3-parm model, 2 covariates, 1 protocol

set.seed(20572)

doselev<-c(0,5,25,50,100,350)
n<-4*c(78,81,81,81,77,80)
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

testout5b<-fitEmaxB(y,dose,prot=prot,prior=prior,modType=3,xbase=x,
									mcmc=mcmc,diagnostics=FALSE,binary=TRUE)

parms<-coef(testout5b)
estimate<-apply(parms,2,mean)
se<-sqrt(diag(var(parms)))
z<-(estimate-c(pop[1],pop[c(2:3)],pop[3]+0.5,bparm))/se

### check parameter estimates
test_that("model parameters agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
})

### check predictions
predout<-predict(testout5b,dosevec=c(20,80),int=1,xvec=c(0,0))

poppred<-plogis(emaxfun(c(20,80),c(pop[c(1:2)],e0)))
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-plogis(e0)))/predout$sedif
### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=0.05,scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-plogis(e0)),tol=0.05,scale=1))
})

### check predictions
predout<-predict(testout5b,dosevec=c(20,80),int=2,xvec=c(0,0))

poppred<-plogis(emaxfun(c(20,80),c(pop[c(1:2)],e0+0.5)))
z<-(predout$pred-poppred)/predout$se
zdif<-(predout$fitdif-(poppred-plogis(e0+0.5)))/predout$sedif


### check predictions 
test_that("predictions agree within 2.5se",{
	expect_lt(as.numeric(max(abs(z))),2.5)
	expect_lt(as.numeric(max(abs(zdif))),2.5)
})

test_that("check absolute levels",{
	expect_that(as.numeric(predout$pred),
							equals(poppred,tol=0.05,scale=1))
	expect_that(as.numeric(predout$fitdif),
							equals((poppred-plogis(e0+0.5)),tol=0.05,scale=1))
})


