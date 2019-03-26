library(greyzoneSurv)


### Name: genSurvData
### Title: Simulate Survival Outcome Given Marker Values
### Aliases: genSurvData

### ** Examples

## Generate package data called "mydata"
## Simulate high/low risk groupings, continuous marker values for each group, and survival data 
## so that the higher maker values correspond to shorter survival. 
n=300
censoring.rate=0.3
rate.lrisk=0.7   #rate of low risk
n.lrisk=n*rate.lrisk
n.hrisk=n-n.lrisk
mu=3  
beta.continuous=0.5
beta.binary=0.5
ran.seed=1000
set.seed(ran.seed)
x0=rnorm(n.lrisk, 0, 1)   #low risk patients have marker values distributed as Normal(0,1)
set.seed(ran.seed)
x1=rnorm(n.hrisk, mu, 1)   #high risk patients have maker values distributed as Normal(mu,1)
score=c(x0, x1)
score.high=c(rep(0, n.lrisk), rep(1, n.hrisk))
mydata=genSurvData(n=n, censoring.rate=censoring.rate,
                beta.continuous=beta.continuous, beta.binary=beta.binary, 
                x=score, xhigh=score.high, ran.seed=ran.seed)$data
dim(mydata)
head(mydata)




