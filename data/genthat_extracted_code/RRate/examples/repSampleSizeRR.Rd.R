library(RRate)


### Name: repSampleSizeRR
### Title: Sample size determination for the replication study based on RR
### Aliases: repSampleSizeRR repSampleSizeRR2

### ** Examples

alpha<-5e-6               #Significance level in the primary study
alphaR<-5e-3              #Significance level in the replication study
zalpha2<-qnorm(1-alpha/2)
zalphaR2<-qnorm(1-alphaR/2)

##Load data
data('smryStats1')        #Example of summary statistics in 1st study
#### Sample size determination ###
n1<-4000                  #Sample size of the primary study
n2_1<-repSampleSizeRR(0.8, n1, log(smryStats1$OR),smryStats1$SE,zalpha2,zalphaR2)

CCR2<-2                   #Control-to-case ration in the replication study
n2_2<-repSampleSizeRR2(0.8, CCR2, log(smryStats1$OR),smryStats1$SE,smryStats1$F_U, 
smryStats1$F_A,zalpha2,zalphaR2)



