library(JQL)


### Name: JQL
### Title: Estimating the Individualized Interval-valued Dose Rule via Jump
###   Q-learning.
### Aliases: JQL

### ** Examples

n=50
d=4
x=matrix(runif(n*(d-1),-1,1),nrow=n,ncol=d-1)
a=runif(n,0,1)
y=(1+x[,1])*(a>=0&a<0.35)+(x[,1]-x[,2])*(a>=0.35&a<0.65)+(1-x[,2])*(a>=0.65&a<=1)+rnorm(n,0,1)
JQL(Y=y,A=a,X=x,folds_num=5,repnum=1)



