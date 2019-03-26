library(qLearn)


### Name: qLearn
### Title: Based on the input contrast vectors, compute point estimates and
###   construct confidence intervals using bootstrap for both stages
### Aliases: qLearn
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(100)
# Simple Simulation on 1000 subjects
sim<-matrix(0,nrow=1000,ncol=7)
colnames(sim)<-c("H1","A1","Y1","H2","A2","Y2","IS2")
sim<-as.data.frame(sim)

# Randomly generate stage 1 covariates and stage 1 and 2 treatments
sim[,c("H1","A1","A2")]<-2*rbinom(1000*3,1,0.5)-1

# Generate stage 2 covariates based on H1 and T1
expit<-exp(0.5*sim$H1+0.5*sim$A1)/(1+exp(0.5*sim$H1+0.5*sim$A1))
sim$H2<-2*rbinom(1000,1,expit)-1

# Assume stage 1 outcome Y1 is 0
# Generate stage 2 outcome Y2 
sim$Y2<-0.5*sim$A2+0.5*sim$A2*sim$A1-0.5*sim$A1+rnorm(1000)

# Randomly assign 500 subjects to S2
sim[sample(1000,500),"IS2"]<-1 
sim[sim$IS2==0,c("A2","Y2")]<-NA

# Define models for both stages
s2Formula<-Y2~H1*A1+A1*A2+A2:H2
s1Formula<-Y1~H1*A1

## Fixed Xi as 0.05
qLearn(s2Formula,s1Formula,sim,s2Treat="A2",interact=c("A1","H2"),
s2Indicator="IS2",s1Method="Fixed Xi",fixedXi=0.05,bootNum=100)




