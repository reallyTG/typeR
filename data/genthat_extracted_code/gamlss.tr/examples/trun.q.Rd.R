library(gamlss.tr)


### Name: trun.q
### Title: Truncated Inverse Cumulative Density Function of a gamlss.family
###   Distribution
### Aliases: trun.q
### Keywords: distribution regression

### ** Examples

# trucated q  continuous function
# continuous
#----------------------------------------------------------------------------------------
# left
test1<-trun.q(par=c(0), family="TF", type="left")
test1(.6)
qTF(pTF(0)+0.6*(1-pTF(0)))
#----------------------------------------------------------------------------------------
# right
test2 <- trun.q(par=c(10), family="BCT", type="right")
test2(.6)
qBCT(0.6*pBCT(10))
#----------------------------------------------------------------------------------------
# both
test3<-trun.q(par=c(-3,3), family="TF", type="both")
test3(.6)
qTF(0.6*(pTF(3)-pTF(-3))+pTF(-3))
#----------------------------------------------------------------------------------------
# varying  par
#----------------------------------------------------------------------------------------
# left
test7<-trun.q(par=c(0,1,2), family="TF", type="left", varying=TRUE)
test7(c(.5,.5,.6))
qTF(pTF(c(0,1,2))+c(.5,.5,.6)*(1-pTF(c(0,1,2))))
#---------------------------------------------------------------------------------------
# right
test9 <- trun.q(par=c(10,11,12), family="BCT", type="right", varying=TRUE)
test9(c(.5,.5,.6))
qBCT(c(.5,.5,.6)*pBCT(c(10,11,12)))
#----------------------------------------------------------------------------------------
# both
test10<-trun.q(par=cbind(c(0,1,2), c(10,11,12)), family="TF", type="both", varying=TRUE)
test10(c(.5, .5, .7))
qTF(c(.5, .5, .7)*(pTF(c(10,11,12))-pTF(c(0,1,2)))+pTF(c(0,1,2)))
#----------------------------------------------------------------------------------------
# FOR DISCRETE DISTRIBUTIONS
# trucated q function
# left
test4<-trun.q(par=c(0), family="PO", type="left")
test4(.6)
qPO(pPO(0)+0.6*(1-pPO(0)))
# varying
test41<-trun.q(par=c(0,1,2), family="PO", type="left", varying=TRUE)
test41(c(.6,.4,.5))
qPO(pPO(c(0,1,2))+c(.6,.4,.5)*(1-pPO(c(0,1,2))))
#----------------------------------------------------------------------------------------
# right
test5 <- trun.q(par=c(10), family="NBI", type="right")
test5(.6)
qNBI(0.6*pNBI(10))
test5(.6, mu=10, sigma=2)
qNBI(0.6*pNBI(10, mu=10, sigma=2), mu=10, sigma=2)
# varying
test51 <- trun.q(par=c(10, 11, 12), family="NBI", type="right", varying=TRUE)
test51(c(.6,.4,.5))
qNBI(c(.6,.4,.5)*pNBI(c(10, 11, 12)))
test51(c(.6,.4,.5), mu=10, sigma=2)
qNBI(c(.6,.4,.5)*pNBI(c(10, 11, 12), mu=10, sigma=2), mu=10, sigma=2)
#----------------------------------------------------------------------------------------
# both
test6<-trun.q(par=c(0,10), family="NBI", type="both")
test6(.6)
qNBI(0.6*(pNBI(10)-pNBI(0))+pNBI(0))
# varying 
test61<-trun.q(par=cbind(c(0,1,2), c(10,11,12)), family="NBI", type="both", varying=TRUE)
test61(c(.6,.4,.5))
qNBI(c(.6,.4,.5)*(pNBI(c(10,11,12))-pNBI(c(0,1,2)))+pNBI(c(0,1,2)))
#----------------------------------------------------------------------------------------



