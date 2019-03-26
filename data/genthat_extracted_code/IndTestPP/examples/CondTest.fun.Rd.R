library(IndTestPP)


### Name: CondTest.fun
### Title: Conditional Test of independence between two Poisson process
### Aliases: CondTest.fun calcNmu

### ** Examples


#Two dependent Poisson processes from  a NHCPSP
set.seed(123)
lambdao1<-runif(1000)/10
set.seed(124)
lambdao2<-runif(1000)/10
set.seed(125)
lambda12<-runif(1000)/20
aux<-DepNHCPSP.fun(lambdai1=lambdao1, lambdai2=lambdao2, lambdai12=lambda12,
	fixed.seed=123)

zz<-CondTest.fun(pos1=aux$posNH1,pos2=aux$posNH2,lambda2=aux$lambda2, r=3)
zz$pvP
zz$pvN





