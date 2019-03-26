context('Evaluations of random generating functions for emaxsim')

rm(list=objects())
set.seed(12357)

#############################################################################
####### continuous
#######
#### FixedMean

nsim<-1000
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)
dose<-rep(doselev,n)

### 3-parm
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop<-c(log(ed50),emax,e0)  
  
meanlev<-emaxfun(doselev,pop)  

genparm1<-FixedMean(n,doselev,meanlev,sdy,pop)  

prec<-2*sdy/sqrt(nsim*mean(n))

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
}

test_that("check FixedMean random y data, 3-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=prec))
    expect_that(genparm1$genP$parm,equals(pop))
})

### 4-parm
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
lambda<-2
sdy<-7.967897
pop<-c(log(ed50),lambda,emax,e0)  
  
meanlev<-emaxfun(doselev,pop)  

genparm1<-FixedMean(n,doselev,meanlev,sdy,pop)  

prec<-2*sdy/sqrt(nsim*mean(n))

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
}

test_that("check FixedMean random y data, 4-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=prec))
    expect_that(genparm1$genP$parm,equals(pop))
})

######################################################
### RandEmax
set.seed(12357)
nsim<-1000

### 3 parm (defaults)
n<-c(99,95,98,94,98,98)
doselev<-c(0,5,10,25,50,150)
dose<-rep(doselev,n)
parmE0<-c(-2.6,2.5)
parmEmax<-c(-1.25,2)
sigma<-0.001

genparm1<-RandEmax(n,doselev,
         parmEmax,parmE0,p50=25,parmLambda=1,resSD=sigma)

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
parmmat<-matrix(numeric(3*nsim),ncol=3)
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
    parmmat[i,]<-out1$parm
}
meanlev<-apply(emaxfun(doselev,parmmat),2,mean)

test_that("check RandEmax, random y data, 3-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=0.1,scale=1))
    expect_that(apply(parmmat,2,mean),equals(c(log(25)+0.79,-1.25,-2.6),
                                             tol=0.1,scale=1))
})


### 4 parm (defaults)
set.seed(12357)
n<-c(99,95,98,94,98,98)
doselev<-c(0,5,10,25,50,150)
dose<-rep(doselev,n)
parmE0<-c(-2.6,2.5)
parmEmax<-c(-1.25,2)
sigma<-0.001

genparm2<-RandEmax(n,doselev,
         parmEmax,parmE0,p50=25,resSD=sigma)

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
parmmat<-matrix(numeric(4*nsim),ncol=4)
for(i in 1:nsim){
    out2<-genparm2$genFun(genparm2$genP)
    mtot[i,]<-tapply(out2$y,dose,mean)   
    parmmat[i,]<-out2$parm
}
meanlev<-apply(emaxfun(doselev,parmmat),2,mean)

test_that("check RandEmax, random y data, 4-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=0.1,scale=1))
    expect_that(apply(parmmat,2,mean),equals(c(log(25)+0.79,6*3.08/(18.15+3.08),-1.25,-2.6),
                                             tol=0.1,scale=1))
})




#############################################################################
####### binary
#######
#### FixedMean
set.seed(12357)

nsim<-1000
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)
dose<-rep(doselev,n)

### 3-parm
e0<-qlogis(0.2)
ed50<-67.481113 
emax<-qlogis(.8)-e0
pop<-c(log(ed50),emax,e0)  
  
meanlev<-plogis(emaxfun(doselev,pop))  

genparm1<-FixedMean(n,doselev,meanlev,parm=pop,binary=TRUE)  

prec<-2*max(sqrt(meanlev*(1-meanlev))/sqrt(nsim*mean(n)))

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
}

test_that("check FixedMean random y data, 3-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=prec))
    expect_that(genparm1$genP$parm,equals(pop))
})

### 4-parm
set.seed(12357)

e0<-2.465375 
ed50<-67.481113 
emax<-qlogis(.8)-e0
lambda<-2
pop<-c(log(ed50),lambda,emax,e0)  
  
meanlev<-plogis(emaxfun(doselev,pop))  

genparm1<-FixedMean(n,doselev,meanlev,parm=pop,binary=TRUE)  

prec<-2*max(sqrt(meanlev*(1-meanlev))/sqrt(nsim*mean(n)))

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
}

test_that("check FixedMean random y data, 4-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=prec))
    expect_that(genparm1$genP$parm,equals(pop))
})

######################################################
### RandEmax
set.seed(12357)
nsim<-1000

### 3 parm (defaults)
n<-c(99,95,98,94,98,98)
doselev<-c(0,5,10,25,50,150)
dose<-rep(doselev,n)
parmE0<-c(qlogis(0.2),2.5)
parmEmax<-c(qlogis(.8)-qlogis(0.2),2)

genparm1<-RandEmax(n,doselev,
         parmEmax,parmE0,p50=25,parmLambda=1, binary=TRUE)

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
parmmat<-matrix(numeric(3*nsim),ncol=3)
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
    parmmat[i,]<-out1$parm
}
meanlev<-apply(plogis(emaxfun(doselev,parmmat)),2,mean)

test_that("check RandEmax, random y data, 3-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=0.1,scale=1))
    expect_that(apply(parmmat,2,mean),equals(c(log(25)+0.79,
								   qlogis(0.8)-qlogis(0.2),qlogis(0.2)),
                                   tol=0.1,scale=1))
})


### 4 parm (defaults)
set.seed(12357)
n<-c(99,95,98,94,98,98)
doselev<-c(0,5,10,25,50,150)
dose<-rep(doselev,n)
parmE0<-c(qlogis(0.2),2.5)
parmEmax<-c(qlogis(.8)-qlogis(0.2),2)

genparm2<-RandEmax(n,doselev,
         parmEmax,parmE0,p50=25,binary=TRUE)

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
parmmat<-matrix(numeric(4*nsim),ncol=4)
for(i in 1:nsim){
    out2<-genparm2$genFun(genparm2$genP)
    mtot[i,]<-tapply(out2$y,dose,mean)   
    parmmat[i,]<-out2$parm
}
meanlev<-apply(plogis(emaxfun(doselev,parmmat)),2,mean)

test_that("check RandEmax, random y data, 4-parm model",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=0.1,scale=1))
    expect_that(apply(parmmat,2,mean),equals(c(log(25)+0.79,6*3.08/(18.15+3.08),
										   qlogis(0.8)-qlogis(0.2),qlogis(0.2)),
                                           tol=0.1,scale=1))
})


##### 3 parm with random variance term
set.seed(12357)
nsim<-1000

### 3 parm (defaults)
n<-c(99,95,98,94,98,98)
doselev<-c(0,5,10,25,50,150)
dose<-rep(doselev,n)
parmE0<-c(-2.6,2.5)
parmEmax<-c(-1.25,2)
sigma<-2
dfSD<-10

genparm1<-RandEmax(n,doselev,
         parmEmax,parmE0,p50=25,parmLambda=1,resSD=sigma,dfSD=dfSD)

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
parmmat<-matrix(numeric(3*nsim),ncol=3)
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
    parmmat[i,]<-out1$parm
}
meanlev<-apply(emaxfun(doselev,parmmat),2,mean)

test_that("check RandEmax, random y data, 3-parm model: random SD",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=0.1,scale=1))
    expect_that(apply(parmmat,2,mean),equals(c(log(25)+0.79,-1.25,-2.6),
                                             tol=0.1,scale=1))
})



##### 4 parm with random variance term
set.seed(12357)
nsim<-1000

### 4 parm (defaults)
n<-c(99,95,98,94,98,98)
doselev<-c(0,5,10,25,50,150)
dose<-rep(doselev,n)
parmE0<-c(-2.6,2.5)
parmEmax<-c(-1.25,2)
sigma<-1.5
dfSD<-20
### default for lambda

genparm1<-RandEmax(n,doselev,
         parmEmax,parmE0,p50=25,resSD=sigma,dfSD=dfSD)

mtot<-matrix(numeric(length(doselev)*nsim),ncol=length(doselev))
parmmat<-matrix(numeric(4*nsim),ncol=4)
for(i in 1:nsim){
    out1<-genparm1$genFun(genparm1$genP)
    mtot[i,]<-tapply(out1$y,dose,mean)   
    parmmat[i,]<-out1$parm
}
meanlev<-apply(emaxfun(doselev,parmmat),2,mean)

test_that("check RandEmax, random y data, 4-parm model: random SD",{
    expect_that(apply(mtot,2,mean),equals(meanlev,tol=0.1,scale=1))
    expect_that(apply(parmmat,2,mean),equals(c(log(25)+0.79,6*3.08/(18.15+3.08),
    																					 -1.25,-2.6),
                                             tol=0.1,scale=1))
})








