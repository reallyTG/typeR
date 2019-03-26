context('SeEmax')

set.seed(12357)

doselev<-c(0,5,25,50,100,250)
n<-c(78,81,81,81,77,80)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
led50<-log(ed50)
emax<-15.127726
lambda=1.8
sdy<-7.967897
pop<-c(led50=led50,lambda=lambda,emax=emax,e0=e0)    
meanresp<-emaxfun(dose,pop)  
y<-rnorm(sum(n),meanresp,sdy)
nls.fit<-nls(y ~ e0 + (emax * dose^lambda)/(dose^lambda + exp(led50*lambda)), 
                         start = pop, control = nls.control(
                         maxiter = 100),trace=TRUE,na.action=na.omit)


out1<-SeEmax(nls.fit,doselev=c(60,120),modType=4)
out2<-SeEmax(list(coef(nls.fit),vcov(nls.fit)),c(60,120),modType=4)

test_that("check different equivalent calls to SeEmax yield same result",{
    expect_that(out1,is_identical_to(out2))
})

####################################################################
#### use emaxsim to perform asymptotic check
###  of SeEmax. also check dif estimates 
###  

set.seed(12357)
nsim<-5000

doselev<-c(0,0.033,0.067,0.167,0.33,0.66,1)
ndose<-length(doselev)
tareff<- -0.313
ndose<-length(doselev)
n<-rep(95,ndose)
sdy<-0.001

#### use pop emax model 
e0<-0
ed50<-.25
lambda<-1
emax<-(ed50^lambda+1)*(tareff)
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-emaxfun(doselev,parm=pop)
gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

D3 <- emaxsim(nsim,gen.parm,modType=3,negEmax=TRUE)
D4 <- emaxsim(nsim,gen.parm,modType=4,negEmax=TRUE)

### summaries

mest3<-apply(D3$fitpredv,2,mean)
mest4<-apply(D4$fitpredv,2,mean)
mpop<-apply(D3$predpop,2,mean)
mestdif3<-apply(D3$fitpredv[,2:ndose]-D3$fitpredv[,1],2,mean)
mestdif4<-apply(D4$fitpredv[,2:ndose]-D4$fitpredv[,1],2,mean)
mpopdif<-apply(D3$predpop[,2:ndose]-D3$predpop[,1],2,mean)

pch3<-mean(abs((D3$fitpredv-D3$predpop)/D3$sepredv)>1.96)
pch4<-mean(abs((D4$fitpredv-D4$predpop)/D4$sepredv)>1.96)
pchdif3<-mean(abs((D3$fitpredv[,2:ndose]-D3$fitpredv[,1]-(D3$predpop[,2:ndose]-
										D3$predpop[,1]))/D3$sedifv[,2:ndose])>1.96)
pchdif4<-mean(abs((D4$fitpredv[,2:ndose]-D4$fitpredv[,1]-(D4$predpop[,2:ndose]-
										D4$predpop[,1]))/D4$sedifv[,2:ndose])>1.96)


test_that("check DR mean estimates",{
    expect_that(mest3,equals(mpop,tol=0.002))
    expect_that(mest4,equals(mpop,tol=0.002))
    expect_that(mestdif3,equals(mpopdif,tol=0.002))
    expect_that(mestdif4,equals(mpopdif,tol=0.002))
})

test_that("check DR SE",{
    expect_that(pch3,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))  
    expect_that(pch4,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))
    expect_that(pchdif3,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))  
    expect_that(pchdif4,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))
})



test_that("check DR SE",{
    expect_that(pch3,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))  
    expect_that(pch4,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))
    expect_that(pchdif3,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))  
    expect_that(pchdif4,equals(0.05,tol=2*sqrt(.25/nsim),scale=1))
})



