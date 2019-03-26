library(G1DBN)


### Name: PRcurve
### Title: PR curves computation
### Aliases: PRcurve
### Keywords: utilities

### ** Examples

library(G1DBN)
## generate the validation matrix
## number of genes
p <- 20
## the network - adjacency Matrix
MyNet <- SimulNetworkAdjMatrix(p,0.05,c(-1,0.5,0.5,1))

## generate the time series 
## initializing the B vector
B <- runif(p,-1,1)
## initializing the variance of the noise
sigmaEps <- runif(p,0.05,0.5)
## initializing the process Xt
X0 <- B + rnorm(p,0,sigmaEps*10)
## number of time points
n <- 20


## the AR(1) times series process
Xn <- SimulGeneExpressionAR1(MyNet$A,B,X0,sigmaEps,n)


## compute score S1 
out<-DBNScoreStep1(Xn)
pr1<-PRcurve(score=out$S1ls,validMat=abs(MyNet$AdjMatrix)>0,dec=FALSE)

## compute score S2 from S1 
## depending on the generated data, the threshold alpha1 has to be chosen differently.
alpha1=0.8
S2<-DBNScoreStep2(S1=out$S1ls,data=Xn,alpha1=alpha1)
pr2_0.8<-PRcurve(score=S2,validMat=abs(MyNet$AdjMatrix)>0,dec=FALSE)

alpha1=0.6
S2<-DBNScoreStep2(S1=out$S1ls,data=Xn,alpha1=alpha1)
pr2_0.6<-PRcurve(score=S2,validMat=abs(MyNet$AdjMatrix)>0,dec=FALSE)

alpha1=0.4
S2<-DBNScoreStep2(S1=out$S1ls,data=Xn,alpha1=alpha1)
pr2_0.4<-PRcurve(score=S2,validMat=abs(MyNet$AdjMatrix)>0,dec=FALSE)

alpha1=0.2
S2<-DBNScoreStep2(S1=out$S1ls,data=Xn,alpha1=alpha1)
pr2_0.2<-PRcurve(score=S2,validMat=abs(MyNet$AdjMatrix)>0,dec=FALSE)

plot(pr1$recall,pr1$precision,type="l",main="PR curves after both Step1 and Step2",
     ylab="PPV", xlab="Sensitivity",lwd=2, xlim=c(0,1),ylim=c(0,1),lty=2)
lines(pr2_0.8$recall,pr2_0.8$precision, col=3,lwd=2)
lines(pr2_0.6$recall,pr2_0.6$precision, col=4,lwd=2)
lines(pr2_0.4$recall,pr2_0.4$precision, col=5,lwd=2)
lines(pr2_0.2$recall,pr2_0.2$precision, col=6,lwd=2)
lines(0:1,c(0,0),lty=3)
lines(0:1,c(1,1),lty=3)
lines(c(0,0),0:1,lty=3)
lines(c(1,1),0:1,lty=3)

leg=c("Step 1", "Step 2 (alpha1=0.8)", "Step 2 (alpha1=0.6)",
      "Step 2 (alpha1=0.4)", "Step 2 (alpha1=0.2)")
legend(0,0.265, leg, lty=c(2,1,1,1,1), col=c(1,3,4,5,6),lwd=array(2,5))



