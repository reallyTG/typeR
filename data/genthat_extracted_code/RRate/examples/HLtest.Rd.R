library(RRate)


### Name: HLtest
### Title: Hosmer-Lemeshow test
### Aliases: HLtest

### ** Examples

alpha<-5e-6               #Significance level in the primary study
alphaR<-5e-3              #Significance level in the replication study
zalpha2<-qnorm(1-alpha/2)
zalphaR2<-qnorm(1-alphaR/2)

##Load data
data('smryStats1')        #Example of summary statistics in 1st study
n2.0<-2000                #Number of individuals in control group
n2.1<-2000                #Number of individuals in case group

SE2<-SEest(n2.0, n2.1, smryStats1$F_U, smryStats1$F_A) #SE in replication study
######  RR estimation  ######
RRresult<-repRateEst(log(smryStats1$OR),smryStats1$SE, SE2,zalpha2,zalphaR2, output=TRUE,dir='.')

#### Hosmer-Lemeshow test  ####
data('smryStats2')        #Example of summary statistics in 2nd study
sigIdx<-(smryStats1$P<alpha)
repIdx<-(sign(smryStats1$Z[sigIdx])*smryStats2$Z[sigIdx]>zalphaR2)
groupNum<-10 
HLresult<-HLtest(repIdx,RRresult$RR,g=groupNum,dir='.')



