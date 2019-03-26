context('emaxsim evaluations')

####################################################################
###### check mcp testing
######
set.seed(12357)
nsim<-1000

doselev<-c(0,0.033,0.067,0.167,0.33,1)
tareff<-0.313
ndose<-length(doselev)
n<-rep(95,ndose)
sdy<-1

parm.mat<-matrix(c( .5,.5,  .05,.5, .95,.5),byrow=T,ncol=2)

parm.mat[,1]<-qgamma(parm.mat[,1],shape=1.05,rate=3.0)  ###ed50
parm.mat[,2]<-qgamma(parm.mat[,2],shape=2.5,rate=1.18) ###lambda


###########################################
#### use pop emax model 
e0<-0
ed50<-qgamma(0.5,shape=1.05,rate=3.0)
lambda<-qgamma(0.5,shape=2.5,rate=1.18)
emax<-(ed50^lambda+1)*(tareff)
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-emaxfun(doselev,parm=pop)

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

### 3 contrasts and linear
emaxMods3<-Mods(sigEmax=cbind(parm.mat[,1],parm.mat[,2]),
               linear=NULL,doses=doselev,placEff=e0,maxEff=1)
emaxMat3<-optContr(emaxMods3,w=n)

#### power from DoseFinding
altmod<-Mods(sigEmax=cbind(parm.mat[1,1],parm.mat[1,2]), doses=doselev, 
          placEff = e0, maxEff=max(meanlev),
          direction ="increasing")

pow3<-as.numeric(powMCT(emaxMat3,alpha=0.05,altModels=altmod,n=n, 
            sigma=sdy,placAdj=FALSE,
            alternative="one.sided",critV=TRUE))

D3 <- emaxsim(nsim,gen.parm,modType=4,testMods=emaxMods3)


test_that("check mcp power calculation",{ expect_that(mean(D3$pVal<0.05),equals(pow3,tol=2.5*sqrt(pow3*(1-pow3)/nsim))) })

### check initial value specification
D3i <- emaxsim(nsim,gen.parm,modType=4,testMods=emaxMods3,iparm=pop)

test_that("check spec of initial values",{
	expect_lt(abs(max(apply((D3$fitpredv-D3i$fitpredv),1,max))),0.2)
}) 

####################################################################

####################################################################
###### check mcp testing.  Repeat with negative target
######
set.seed(12357)
nsim<-1000

doselev<-c(0,0.033,0.067,0.167,0.33,1)
tareff<- -0.313
ndose<-length(doselev)
n<-rep(95,ndose)
sdy<-1

parm.mat<-matrix(c( .5,.5,  .05,.5, .95,.5),byrow=T,ncol=2)

parm.mat[,1]<-qgamma(parm.mat[,1],shape=1.05,rate=3.0)  ###ed50
parm.mat[,2]<-qgamma(parm.mat[,2],shape=2.5,rate=1.18) ###lambda


###########################################
#### use pop emax model 
e0<-0
ed50<-qgamma(0.5,shape=1.05,rate=3.0)
lambda<-qgamma(0.5,shape=2.5,rate=1.18)
emax<-(ed50^lambda+1)*(tareff)
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-emaxfun(doselev,parm=pop)

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

### 3 contrasts and linear
emaxMods3<-Mods(sigEmax=cbind(parm.mat[,1],parm.mat[,2]),
               linear=NULL,doses=doselev,placEff=e0,maxEff=-1)
emaxMat3<-optContr(emaxMods3,w=n)

#### power from DoseFinding
altmod<-Mods(sigEmax=cbind(parm.mat[1,1],parm.mat[1,2]), doses=doselev, 
          placEff = e0, maxEff=min(meanlev),
          direction ="decreasing")

pow3n<-as.numeric(powMCT(emaxMat3,alpha=0.05,altModels=altmod,n=n, 
            sigma=sdy,placAdj=FALSE,
            alternative="one.sided",critV=TRUE))

D3n <- emaxsim(nsim,gen.parm,modType=4,testMods=emaxMods3,negEmax=TRUE)


test_that("check mcp power calculation",{
    expect_that(mean(D3n$pVal<0.05),equals(pow3n,tol=2.5*sqrt(pow3*(1-pow3)/nsim)))
})

### 3 contrasts only
emaxMods3<-Mods(sigEmax=cbind(parm.mat[,1],parm.mat[,2]),
               doses=doselev,placEff=e0,maxEff=-1)
emaxMat3<-optContr(emaxMods3,w=n)

#### power from DoseFinding
altmod<-Mods(sigEmax=cbind(parm.mat[1,1],parm.mat[1,2]), doses=doselev, 
          placEff = e0, maxEff=min(meanlev),
          direction ="decreasing")

pow3n3<-as.numeric(powMCT(emaxMat3,alpha=0.05,altModels=altmod,n=n, 
            sigma=sdy,placAdj=FALSE,
            alternative="one.sided",critV=TRUE))

D3n3 <- emaxsim(nsim,gen.parm,modType=4,
							 ed50contr=as.vector(parm.mat[,1]),
							 lambdacontr = as.vector(parm.mat[,2]),
							 negEmax=TRUE)


test_that("check mcp power calculation",{
    expect_that(mean(D3n3$pVal<0.05),equals(pow3n3,tol=2.5*sqrt(pow3*(1-pow3)/nsim)))
})



####################################################################


####################################################################
### large sample near-exact with negative emax  4-parm
set.seed(12357)
nsim<-1000

doselev<-c(0,0.033,0.067,0.167,0.33,1)
tareff<- -0.313
ndose<-length(doselev)
n<-rep(95,ndose)
sdy<-0.01

parm.mat<-matrix(c( .5,.5,  .05,.5, .95,.5),byrow=T,ncol=2)

parm.mat[,1]<-qgamma(parm.mat[,1],shape=1.05,rate=3.0)  ###ed50
parm.mat[,2]<-qgamma(parm.mat[,2],shape=2.5,rate=1.18) ###lambda

###########################################
#### use pop emax model 
e0<-0
ed50<-qgamma(0.5,shape=1.05,rate=3.0)
lambda<-qgamma(0.5,shape=2.5,rate=1.18)
emax<-(ed50^lambda+1)*(tareff)
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-emaxfun(doselev,parm=pop)

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

### 1 contrast
emaxMods1<-Mods(sigEmax=cbind(parm.mat[1,1],parm.mat[1,2]),
               doses=doselev,placEff=e0,maxEff=-1)
emaxMat1<-optContr(emaxMods1,w=n)

D1 <- emaxsim(nsim,gen.parm,modType=4,testMods=emaxMods1)

parmmean<-apply(coef(D1)$est,2,mean)

predsim1<-predict(D1,dose=0.033)


test_that("check asymptotic distributions for 4-parm model",{
    expect_that(as.numeric(parmmean),equals(pop,tol=0.01))
})

test_that("predict.emaxsim matches emaxsim internal values",{
    expect_that(as.numeric(predsim1$fitpredv),
                equals((as.numeric(D1$fitpredv[,2]))))
    expect_that(as.numeric(predsim1$sepredv),
                equals((as.numeric(D1$sepredv[,2]))))
    expect_that(as.numeric(predsim1$sedifv),
                equals((as.numeric(D1$sedifv[,2]))))
})
####################################################################

####################################################################
##########################################################
### large sample near-exact with negative emax  repeat with 3-parm
set.seed(12357)
nsim<-1000

doselev<-c(0,0.033,0.067,0.167,0.33,1)
tareff<- -0.313
ndose<-length(doselev)
n<-rep(95,ndose)
sdy<-0.01

###########################################
#### use pop emax model 
e0<-0
ed50<-qgamma(0.5,shape=1.05,rate=3.0)
lambda<-1
emax<-(ed50^lambda+1)*(tareff)
pop<-c(log(ed50),emax,e0)
meanlev<-emaxfun(doselev,parm=pop)

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

### 1 contrast
D1 <- emaxsim(nsim,gen.parm,modType=3)

parmmean<-apply(coef(D1)$est[,1:3],2,mean)

predsim1<-predict(D1,dose=0.033)


test_that("check asymptotic distributions for 3-parm model",{
    expect_that(as.numeric(parmmean),equals(pop,tol=0.01))
})

test_that("predict.emaxsim matches emaxsim internal values",{
    expect_that(as.numeric(predsim1$fitpredv),
                equals((as.numeric(D1$fitpredv[,2]))))
    expect_that(as.numeric(predsim1$sepredv),
                equals((as.numeric(D1$sepredv[,2]))))
    expect_that(as.numeric(predsim1$sedifv),
                equals((as.numeric(D1$sedifv[,2]))))
})

D1i <- emaxsim(nsim,gen.parm,modType=3,iparm=pop)

test_that("check spec of initial values with 3-parm model",{
	expect_lt(abs(max(apply((D1$fitpredv-D1i$fitpredv),1,max))),0.2)
}) 



####################################################################




####################################################################
##########  binary
####################################################################

####################################################################
###### check mcp testing
######
set.seed(12357)
nsim<-1000

doselev<-c(0,0.033,2*0.033,4*0.033,8*0.033,16*0.033)
ndose<-length(doselev)
n<-rep(40,ndose)

parm.mat<-matrix(c( .5,.5,  .05,.5, .95,.5),byrow=T,ncol=2)

parm.mat[,1]<-qgamma(parm.mat[,1],shape=1.05,rate=3.0)  ###ed50
parm.mat[,2]<-rep(1,3) ###lambda


###########################################
#### use pop emax model 
e0<-qlogis(.2)
ed50<-0.15
lambda<-1
emax<-qlogis(0.55)-e0
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-plogis(emaxfun(doselev,parm=pop))

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop,binary=TRUE)  

### variance matrix for logistic rates
V<-diag(1/(meanlev*(1-meanlev)*n))

### 3 contrasts and linear
emaxMods3<-Mods(sigEmax=cbind(parm.mat[,1],parm.mat[,2]),
               linear=NULL,doses=doselev,placEff=e0,maxEff=1)
emaxMat3<-optContr(emaxMods3,S=V)

#### power from DoseFinding
altmod<-Mods(sigEmax=cbind(parm.mat[1,1],parm.mat[1,2]), doses=doselev, 
          placEff = e0, maxEff=max(qlogis(meanlev)-qlogis(meanlev[1])),
          direction ="increasing")

pow3<-as.numeric(powMCT(emaxMat3,alpha=0.05,altModels=altmod, 
            S=V,df=Inf,placAdj=FALSE,
            alternative="one.sided",critV=TRUE))

rseed<<-.Random.seed
D3 <- emaxsim(nsim,gen.parm,modType=4,testMods=emaxMods3,binary=TRUE)

test_that("check mcp power calculation",{
    expect_that(mean(D3$pVal<0.05),equals(pow3,tol=0.02,scale=1))
})

### 3 parameter fit, different format for testing contrasts
.Random.seed<<-rseed
D3 <- emaxsim(nsim,gen.parm,modType=3,ed50contr=parm.mat[,1],
			  lambdacontr=parm.mat[,2],binary=TRUE)

test_that("check mcp power calculation",{
    expect_that(mean(D3$pVal<0.05),equals(pow3,tol=0.02,scale=1))
})

####################################################################
### simulation to test prediction and parameters

set.seed(12357)
nsim<-1000

doselev<-c(0,0.033,2*0.033,4*0.033,8*0.033,16*0.033)
ndose<-length(doselev)
n<-10*rep(95,ndose)
###########################################
#### use pop emax model 
e0<-qlogis(.2)
ed50<-0.15
lambda<-1
emax<-qlogis(0.55)-e0
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-plogis(emaxfun(doselev,parm=pop))

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop,binary=TRUE)  

D4 <- emaxsim(nsim,gen.parm,modType=4,testMods=emaxMods3,binary=TRUE)

###
test_that("check DR for coverage",{
    expect_that(as.numeric(apply(abs(D4$fitpredv-D4$predpop)/D4$sepredv<1.96,2,mean)),
	equals(rep(0.95,ndose),tol=2*sqrt(.95*.05/nsim)))
})

########################################################
##### test summary and reporting of most favorable results
set.seed(12357)
nsim<-10000
idmax<-5
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)
Ndose<-length(doselev)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-4.127726
sdy<-7.967897
pop<-c(log(ed50),emax,e0)    
meanlev<-emaxfun(doselev,pop)  

###FixedMean is specialized constructor function for emaxsim
gen<-FixedMean(n,doselev,meanlev,sdy)  

prior<-prior.control(epmu=0,epsd=30,emaxmu=0,emaxsd=30,p50=50,sigmalow=0.1,
										 sigmaup=30,edDF=5)
mcmc<-mcmc.control(chains=1,warmup=500,iter=5000,seed=53453,propInit=0.15,adapt_delta = 0.95)

D2e <- emaxsim(nsim,gen, modType=3)
sink("NUL")
out2e<-summary(D2e)
sink()
#########################################
### repeat but negative trend
set.seed(1357)
nsim<-10000
idmax<-5
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)
Ndose<-length(doselev)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<- -4.127726
sdy<-7.967897
pop<-c(log(ed50),emax,e0)    
meanlev<-emaxfun(doselev,pop)  

###FixedMean is specialized constructor function for emaxsim
gen<-FixedMean(n,doselev,meanlev,sdy)  

prior<-prior.control(epmu=0,epsd=30,emaxmu=0,emaxsd=30,p50=50,sigmalow=0.1,
										 sigmaup=30,edDF=5)
mcmc<-mcmc.control(chains=1,warmup=500,iter=5000,seed=53453,propInit=0.15,adapt_delta = 0.95)

D2en <- emaxsim(nsim,gen, modType=3,negEmax=TRUE)


sink("NUL")
oute2n<-summary(D2en)
sink()
###
test_that("check selected bias pos/neg",{
	expect_that(as.numeric(out2e$biasSelMean),
							equals(as.numeric(-oute2n$biasSelMean),tol=0.03,scale=1))
})

###
test_that("check selected rsms pos/neg",{
	expect_that(as.numeric(out2e$mseSelMean),
							equals(as.numeric(oute2n$mseSelMean),tol=0.03,scale=1))
})

###
test_that("check selected 1-sided errors pos/neg",{
	expect_that(as.numeric(out2e$errUpSelMean),
							equals(as.numeric(oute2n$errLowSelMean),tol=0.01,scale=1))
})
