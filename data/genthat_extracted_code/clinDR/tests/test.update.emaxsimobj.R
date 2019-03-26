context('test update and extract functions for emaxsim')

set.seed(12357)
nsim<-3
idmax<-5
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop<-c(log(ed50),emax,e0)    
meanlev<-emaxfun(doselev,pop)  

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,sdy)  

D1 <- emaxsim(nsim,gen.parm,nproc=3)
e3<-D1[3]

#### re-try estimation starting at the population value
e3u<- update(e3,pop)

test_that("check update.emaxsimobj",{
    expect_that(as.numeric(as.numeric(e3u$est3)),
                equals(as.numeric(e3$est3),tol=0.0001))
})

test_that("check extract emaxsimobj",{
    expect_that(as.numeric(as.numeric(e3$fitpred)),
                equals(as.numeric(D1$fitpredv[3,]),tol=0.0001))
    expect_that(as.numeric(as.numeric(e3$sepred)),
                equals(as.numeric(D1$sepredv[3,]),tol=0.0001))
    expect_that(as.numeric(as.numeric(e3$sedif)),
                equals(as.numeric(D1$sedifv[3,]),tol=0.0001))
})

#############################################
##### binary
set.seed(12357)
nsim<-3
idmax<-5
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)

### population parameters for simulation
e0<-qlogis(0.25) 
ed50<- 25
emax<-qlogis(.75)-e0
pop<-c(log(ed50),emax,e0)    
meanlev<-plogis(emaxfun(doselev,pop))  

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,binary=TRUE)  

D1 <- emaxsim(nsim,gen.parm,binary=TRUE,nproc=3)
e3<-D1[3]

#### re-try estimation starting at the population value
e3u<- update(e3,pop)

test_that("check update.emaxsimobj",{
    expect_that(as.numeric(as.numeric(e3u$est3)),
                equals(as.numeric(e3$est3),tol=0.0001))
})

test_that("check extract emaxsimobj",{
    expect_that(as.numeric(as.numeric(e3$fitpred)),
                equals(as.numeric(D1$fitpredv[3,]),tol=0.0001))
    expect_that(as.numeric(as.numeric(e3$sepred)),
                equals(as.numeric(D1$sepredv[3,]),tol=0.0001))
    expect_that(as.numeric(as.numeric(e3$sedif)),
                equals(as.numeric(D1$sedifv[3,]),tol=0.0001))
})


