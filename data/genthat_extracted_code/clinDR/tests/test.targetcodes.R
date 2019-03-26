context('targetD evaluation')

#####################
### 3-parm
set.seed(12357)
nsim<-1000
doselev<-c(0,5,25,50,100,250)
n<-c(78,81,81,81,77,80)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-15.0               #67.481113 
emax<-15.127726
pop<-c(led50=log(ed50),emax=emax,e0=e0)  
sdy<-0.001
gen.parm<-FixedMean(n,doselev,emaxfun(doselev,pop),sdy)  
D3 <- emaxsim(nsim,gen.parm,modType=3)

tarE<-4
tarD<-ed50*tarE/(emax-tarE)
out<-NULL
for(i in 1:nsim){
    out<-rbind(out,targetD(D3[i],target=tarE))
}


test_that("check asymptotic distribution of targetD 3-parm estimates",{
    expect_that(mean(abs((out[,1]-tarD)/out[,2])>1.96),equals(0.05,
									tol=1.96*sqrt(.95*.05/nsim),scale=1))
})

test_that("check asymptotic distribution of parameter estimates",{
    expect_that(mean(abs((D3$est3[,1]-log(ed50))/sqrt(vcov(D3)[,1]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
    expect_that(mean(abs((D3$est3[,2]-emax)/sqrt(vcov(D3)[,5]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
     expect_that(mean(abs((D3$est3[,3]-e0)/sqrt(vcov(D3)[,9]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
})

############################################
### 4-parm
set.seed(12354)
nsim<-1000
doselev<-c(0,5,25,50,100,250)
n<-c(78,81,81,81,77,80)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-15.0               #67.481113 
emax<-15.127726
#sdy<-0.7967897
pop<-c(led50=log(ed50),emax=emax,e0=e0)  
sdy<-0.0005
gen.parm<-FixedMean(n,doselev,emaxfun(doselev,pop),sdy)  
D4 <- emaxsim(nsim,gen.parm,modType=4)

tarE<-4
tarD<-ed50*tarE/(emax-tarE)
out<-NULL
for(i in 1:nsim){
    out<-rbind(out,targetD(D4[i],target=tarE))
}


test_that("check asymptotic distribution of targetD 4-parm estimates",{
    expect_that(mean(abs((out[,1]-tarD)/out[,2])>1.96),equals(0.05,
									tol=1.96*sqrt(.95*.05/nsim),scale=1))
})

test_that("check asymptotic distribution of parameter estimates",{
    expect_that(mean(abs((D4$est4[,1]-log(ed50))/sqrt(vcov(D4)[,1]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
    expect_that(mean(abs((D4$est4[,2]-1)/sqrt(vcov(D4)[,6]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
     expect_that(mean(abs((D4$est4[,3]-emax)/sqrt(vcov(D4)[,11]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
    expect_that(mean(abs((D4$est4[,4]-e0)/sqrt(vcov(D4)[,16]))>1.96),equals(0.05,tol=1.96*sqrt(.95*.05/nsim),scale=1))
})

############################################
##### check 2-parm fits
############################################
set.seed(12357)
nsim<-1000
doselev<-c(0,5,25,50,100,250)
n<-c(78,81,81,81,77,80)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-30.0               #67.481113 
emax<-15.127726
sdy<-24
pop<-c(led50=log(ed50),emax=emax,e0=e0)  
gen.parm<-FixedMean(n,doselev,emaxfun(doselev,pop),sdy)  
D4 <- emaxsim(nsim,gen.parm,modType=4)

tarE<-4
tarD<-ed50*tarE/(emax-tarE)
out<-NULL
for(i in 1:nsim){
    out<-rbind(out,targetD(D4[i],target=tarE))
}

indL<-which(D4$fitType=='L')
indLL<-which(D4$fitType=='LL')
indE<-which(D4$fitType=='E')

indno<-c(indL,indLL,indE)

maxse<-max(out[-indno,2])
minse<-min(out[-indno,2])
#### confirm that se from linear models are within range of emax se
test_that("check SE from linear fits",{
    expect_lt(max(out[indL,2]),maxse)
    expect_gt(min(out[indL,2]),minse)
    expect_lt(max(out[indLL,2]),maxse)
    expect_gt(min(out[indLL,2]),minse)
    expect_lt(max(out[indE,2]),maxse)
    expect_gt(min(out[indE,2]),minse)
})

#############################################################
#### binary
#####################
### 4-parm
set.seed(12354)
nsim<-1000
doselev<-c(0,5,25,50,100,250)
n<-c(78,81,81,81,77,80)*10
dose<-rep(doselev,n)

### population parameters for simulation
e0<-qlogis(.2)
ed50<-15.0               #67.481113 
emax<-qlogis(.6)-e0
pop<-c(led50=log(ed50),emax=emax,e0=e0)  
gen.parm<-FixedMean(n,doselev,plogis(emaxfun(doselev,pop)),binary=TRUE)  
D4 <- emaxsim(nsim,gen.parm,modType=4,binary=TRUE)

tarE<-0.15
Q<-qlogis(tarE+plogis(e0))-e0
tarD<-ed50*Q/(emax-Q)
out<-NULL
for(i in 1:nsim){
    out<-rbind(out,targetD(D4[i],target=tarE))
}


test_that("check asymptotic distribution of targetD 4-parm estimates",{
    expect_that(mean(abs((out[,1]-tarD)/out[,2])>1.96),equals(0.05,
									tol=3*sqrt(.95*.05/nsim),scale=1))
})

test_that("check asymptotic distribution of parameter estimates",{
    expect_that(mean(abs((D4$est4[,1]-log(ed50))/sqrt(vcov(D4)[,1]))>1.96,na.rm=T),equals(0.05,tol=3*sqrt(.95*.05/nsim),scale=1))
    expect_that(mean(abs((D4$est4[,2]-1)/sqrt(vcov(D4)[,6]))>1.96,na.rm=T),equals(0.05,tol=3.5*sqrt(.95*.05/nsim),scale=1))
     expect_that(mean(abs((D4$est4[,3]-emax)/sqrt(vcov(D4)[,11]))>1.96,na.rm=T),equals(0.05,tol=3*sqrt(.95*.05/nsim),scale=1))
    expect_that(mean(abs((D4$est4[,4]-e0)/sqrt(vcov(D4)[,16]))>1.96,na.rm=T),equals(0.05,tol=3*sqrt(.95*.05/nsim),scale=1))
})

#########
### check linear fits
###
### 3-parm
set.seed(12354)
nsim<-1000
doselev<-c(0,5,25,50,100,250)
n<-trunc(c(78,81,81,81,77,80)/2)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-qlogis(.2)
ed50<-15.0               #67.481113 
emax<-qlogis(.6)-e0
pop<-c(led50=log(ed50),emax=emax,e0=e0)  
gen.parm<-FixedMean(n,doselev,plogis(emaxfun(doselev,pop)),binary=TRUE)  
D3 <- emaxsim(nsim,gen.parm,modType=3,binary=TRUE)

tarE<-0.15
Q<-qlogis(tarE+plogis(e0))-e0
tarD<-ed50*Q/(emax-Q)
out<-NULL
for(i in 1:nsim){
    out<-rbind(out,targetD(D3[i],target=tarE))
}

indL<-which(D3$fitType=='L')
indLL<-which(D3$fitType=='LL')
indE<-which(D3$fitType=='E')

indno<-c(indL,indLL,indE)

maxse<-max(out[-indno,2],na.rm=T)
minse<-min(out[-indno,2],na.rm=T)
#### confirm that se from linear models are within range of emax se
test_that("check SE from linear fits",{
    expect_lt(max(out[indL,2],na.rm=T),maxse)
    expect_gt(min(out[indL,2],na.rm=T),minse)
    expect_lt(max(out[indLL,2],na.rm=T),maxse)
    expect_gt(min(out[indLL,2],na.rm=T),minse)
    expect_lt(max(out[indE,2],na.rm=T),maxse)
    expect_gt(min(out[indE,2],na.rm=T),minse)
})





##############################################################################
##### targetCI
context('targetCI evaluation')

set.seed(12357)
nsim<-1000
doselev<-c(0,5,25,50,100)
n<-trunc(c(78,81,81,81,77)/10)

### population parameters for simulation
e0<-2.465375 
ed50<-25
emax<-15.127726
sdy<-0.7967897
pop<-c(log(ed50),emax,e0)    
meanlev<-emaxfun(doselev,pop)  

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

D1 <- emaxsim(nsim,gen.parm,modType=3)

target<-6
tD<- ( (target*ed50)/(emax-target) )
selectedDose<-targetCI(D1,target,dgrid=seq(tD-3,tD+3,length=200),cilev=0.80,high=TRUE)

outp<-emaxfun(selectedDose,pop)-emaxfun(0,pop)

test_that("check asymptotic prediction for targetCI estimates",{
    expect_that(mean(outp<target),equals(1-0.80,tol=2*sqrt(0.2*0.8/nsim),scale=1))
})

##########################################################
### binary 4-parm
set.seed(12357)
nsim<-1000
doselev<-c(0,5,25,50,100)
n<-trunc(c(78,81,81,81,77)*10)

### population parameters for simulation
e0<-qlogis(.2)
ed50<-25
emax<-qlogis(.6)-e0
sdy<-0.7967897
pop<-c(log(ed50),emax,e0)    
meanlev<-plogis(emaxfun(doselev,pop))

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,parm=pop,binary=TRUE)  

D1 <- emaxsim(nsim,gen.parm,modType=4,binary=TRUE)

target<-0.2
tD<- (qlogis(target+plogis(e0))-e0)*ed50/(emax-(qlogis(target+plogis(e0))-e0)) 
selectedDose<-targetCI(D1,target,dgrid=seq(tD-3,tD+3,length=200),cilev=0.80,high=TRUE)

outp<-plogis(emaxfun(selectedDose,pop))-plogis(emaxfun(0,pop))

test_that("check asymptotic prediction for targetCI estimates",{
    expect_that(mean(outp<target),equals(1-0.80,tol=2*sqrt(0.2*0.8/nsim),scale=1))
})


