context('reporting functions predict.emaxsim,predict.emaxsimobj,predict.emaxalt')

set.seed(12357)
nsim<-50

doselev<-c(0,0.033,0.067,0.167,0.33,1)
tareff<-0.313
ndose<-length(doselev)
n<-rep(95,ndose)
sdy<-1

###########################################
#### use pop emax model 
e0<-0
ed50<-qgamma(0.5,shape=1.05,rate=3.0)
lambda<-qgamma(0.5,shape=2.5,rate=1.18)
emax<-(ed50^lambda+1)*(tareff)
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-emaxfun(doselev,parm=pop)

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop)  

D3 <- emaxsim(nsim,gen.parm,modType=4)


test_that("check predict.emaxsim",{
    expect_that(as.numeric(predict(D3,dose=0.033)$fitpredv),equals(D3$fitpredv[,2]))
    expect_that(as.numeric(predict(D3,dose=0.033)$sepredv),equals(D3$sepredv[,2]))
    expect_that(as.numeric(predict(D3,dose=0.033)$sedifv),equals(D3$sedifv[,2]))
})

test_that("check predict.emaxsimobj",{
    expect_that(as.numeric(predict(D3[1],dose=0.033)$fitpred),equals(as.numeric(D3$fitpredv[1,2]))) ## 3 parm
    expect_that(as.numeric(predict(D3[1],dose=0.033)$sepred),equals(as.numeric(D3$sepredv[1,2])))
    expect_that(as.numeric(predict(D3[1],dose=0.033)$sedif),equals(as.numeric(D3$sedifv[1,2])))

    expect_that(as.numeric(predict(D3[3],dose=0.033)$fitpred),equals(as.numeric(D3$fitpredv[3,2]))) ## exponential 
    expect_that(as.numeric(predict(D3[3],dose=0.033)$sepred),equals(as.numeric(D3$sepredv[3,2])))
    expect_that(as.numeric(predict(D3[3],dose=0.033)$sedif),equals(as.numeric(D3$sedifv[3,2])))

    expect_that(as.numeric(predict(D3[4],dose=0.033)$fitpred),equals(as.numeric(D3$fitpredv[4,2]))) ##  4 parm
    expect_that(as.numeric(predict(D3[4],dose=0.033)$sepred),equals(as.numeric(D3$sepredv[4,2])))
    expect_that(as.numeric(predict(D3[4],dose=0.033)$sedif),equals(as.numeric(D3$sedifv[4,2])))

    expect_that(as.numeric(predict(D3[11],dose=0.033)$fitpred),equals(as.numeric(D3$fitpredv[11,2]))) ##log-linear
    expect_that(as.numeric(predict(D3[11],dose=0.033)$sepred),equals(as.numeric(D3$sepredv[11,2])))
    expect_that(as.numeric(predict(D3[11],dose=0.033)$sedif),equals(as.numeric(D3$sedifv[11,2])))

    expect_that(as.numeric(predict(D3[14],dose=0.033)$fitpred),equals(as.numeric(D3$fitpredv[14,2]))) ##linear
    expect_that(as.numeric(predict(D3[14],dose=0.033)$sepred),equals(as.numeric(D3$sepredv[14,2])))
    expect_that(as.numeric(predict(D3[14],dose=0.033)$sedif),equals(as.numeric(D3$sedifv[14,2])))

})


test_that("check predict.emaxalt",{
    expect_that(as.numeric(predict(emaxalt(D3[1]$y,D3[1]$dose,modType=4),dose=0.033)$fitpred),
                equals(as.numeric(D3$fitpredv[1,2]))) ## 3 parm
    expect_that(as.numeric(predict(emaxalt(D3[1]$y,D3[1]$dose,modType=4),dose=0.033)$sepred),
                equals(as.numeric(D3$sepredv[1,2])))
    expect_that(as.numeric(predict(emaxalt(D3[1]$y,D3[1]$dose,modType=4),dose=0.033)$sedif),
                equals(as.numeric(D3$sedifv[1,2])))

    expect_that(as.numeric(predict(emaxalt(D3[3]$y,D3[3]$dose,modType=4),dose=0.033)$fitpred),
                equals(as.numeric(D3$fitpredv[3,2]))) ## exponential
    expect_that(as.numeric(predict(emaxalt(D3[3]$y,D3[3]$dose,modType=4),dose=0.033)$sepred),
                equals(as.numeric(D3$sepredv[3,2])))
    expect_that(as.numeric(predict(emaxalt(D3[3]$y,D3[3]$dose,modType=4),dose=0.033)$sedif),
                equals(as.numeric(D3$sedifv[3,2])))

    expect_that(as.numeric(predict(emaxalt(D3[4]$y,D3[4]$dose,modType=4),dose=0.033)$fitpred),
                equals(as.numeric(D3$fitpredv[4,2]))) ## 4-parm
    expect_that(as.numeric(predict(emaxalt(D3[4]$y,D3[4]$dose,modType=4),dose=0.033)$sepred),
                equals(as.numeric(D3$sepredv[4,2])))
    expect_that(as.numeric(predict(emaxalt(D3[4]$y,D3[4]$dose,modType=4),dose=0.033)$sedif),
                equals(as.numeric(D3$sedifv[4,2])))

    expect_that(as.numeric(predict(emaxalt(D3[11]$y,D3[11]$dose,modType=4),dose=0.033)$fitpred),
                equals(as.numeric(D3$fitpredv[11,2]))) ## log-linear
    expect_that(as.numeric(predict(emaxalt(D3[11]$y,D3[11]$dose,modType=4),dose=0.033)$sepred),
                equals(as.numeric(D3$sepredv[11,2])))
    expect_that(as.numeric(predict(emaxalt(D3[11]$y,D3[11]$dose,modType=4),dose=0.033)$sedif),
                equals(as.numeric(D3$sedifv[11,2])))

    expect_that(as.numeric(predict(emaxalt(D3[13]$y,D3[13]$dose,modType=4),dose=0.033)$fitpred),
                equals(as.numeric(D3$fitpredv[13,2]))) ## log-linear
    expect_that(as.numeric(predict(emaxalt(D3[13]$y,D3[13]$dose,modType=4),dose=0.033)$sepred),
                equals(as.numeric(D3$sepredv[13,2])))
    expect_that(as.numeric(predict(emaxalt(D3[13]$y,D3[13]$dose,modType=4),dose=0.033)$sedif),
                equals(as.numeric(D3$sedifv[13,2])))
})


############################################
##### binary
#####
####################################################################
### simulation to test prediction and parameters

################################################
#### test predict.emaxsim
set.seed(12357)
nsim<-100

doselev<-c(0,0.033,2*0.033,4*0.033,8*0.033,16*0.033)
ndose<-length(doselev)
n<-rep(95,ndose)
###########################################
#### use pop emax model 
e0<-qlogis(.2)
ed50<-0.15
lambda<-1
emax<-qlogis(0.55)-e0
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-plogis(emaxfun(doselev,parm=pop))

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop,binary=TRUE)  

D5 <- emaxsim(nsim,gen.parm,modType=4,binary=TRUE)

predD5<-predict(D5,dose=c(0.15,0.25,0.5))

#### test extract and predict.emaxsimobj
predD5e10<-predict(D5[10],dose=c(0.15,0.25,0.5))

### compare to emaxsim prediction
test_that("check DR for coverage",{
    expect_that(predD5e10$fitpred,
	equals(predD5$fitpred[10,],tol=1.5e-8))
    expect_that(predD5e10$fitdif,
	equals(predD5$fitdif[10,],tol=1.5e-8))
    expect_that(predD5e10$sepred,
	equals(predD5$sepred[10,],tol=1.5e-8))
    expect_that(as.numeric(predD5e10$sedif),
	equals(as.numeric(predD5$sedif[10,]),tol=1.5e-8))
})

#### predict.emaxalt test
set.seed(12357)
genparm<-FixedMean(n,doselev,meanlev,sdy,parm=pop,binary=TRUE)  
dose<-genparm$genP$dose
y<-genparm$genFun(genparm$genP)[['y']]


simout<-emaxalt(y,dose,binary=TRUE)
pout<-predict(simout,dose=c(0.033,0.528))
test_that("check DR for coverage",{
    expect_that(pout$fitpred,
	equals(simout$fitpred[c(2,6)],tol=1.5e-8))
    expect_that(pout$sepred,
	equals(simout$sepred[c(2,6)],tol=1.5e-8))
    expect_that(as.numeric(pout$sedif),
	equals(as.numeric(simout$sedif[c(2,6)],tol=1.5e-8)))
})


test_that("check DR for coverage",{
    expect_that(pout$fitpred,
	equals(simout$fitpred[c(2,6)],tol=1.5e-8))
    expect_that(pout$sepred,
	equals(simout$sepred[c(2,6)],tol=1.5e-8))
    expect_that(as.numeric(pout$sedif),
	equals(as.numeric(simout$sedif[c(2,6)]),tol=1.5e-8))
})

####################################################################





