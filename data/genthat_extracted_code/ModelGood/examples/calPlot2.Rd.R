library(ModelGood)


### Name: calPlot2
### Title: Calibration plots for binary data
### Aliases: calPlot2

### ** Examples

set.seed(40)
N=40
Y=rbinom(N,1,.5)
X1=rnorm(N)
X1[Y==1]=rnorm(sum(Y==1),mean=rbinom(sum(Y==1),1,.5))
X2=rnorm(N)
X2[Y==0]=rnorm(sum(Y==0),mean=rbinom(sum(Y==0),3,.5))
dat <- data.frame(Y=Y,X1=X1,X2=X2)
lm1 <- glm(Y~X1,data=dat,family="binomial")
lm2 <- glm(Y~X2,data=dat,family="binomial")
calPlot2(list(lm1,lm2),data=dat)



