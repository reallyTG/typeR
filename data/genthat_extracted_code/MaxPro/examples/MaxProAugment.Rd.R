library(MaxPro)


### Name: MaxProAugment
### Title: Augment an Existing Design based on the Maximum Projection
###   Criterion
### Aliases: MaxProAugment
### Keywords: Design of Experiments Computer Experiments

### ** Examples


ExistDesign=matrix(c(0.11,0.96,0.42,0.99),ncol=2,byrow=TRUE)

#Generate candidate design points that satisfy the factor constraints
S=CandPoints(N=10000,p_cont=2)
S=S[S[,1]+S[,2]<=1.5,] #constraint 1
S=S[(S[,1]-.5)^2+(S[,2]-.5)^2>=(2*.25^2),] #constraint 2
plot(S[,1],S[,2],bty="n",cex=.5,xlab=expression(x[1]),ylab=expression(x[2]),xlim=c(0,1),ylim=c(0,1))

result=MaxProAugment(ExistDesign, CandDesign=S, nNew=20)
D=result$Design
points(D[,1],D[,2],col='red',pch=16)
text(D[,1],D[,2],1:nrow(D),col=2,cex=2)





