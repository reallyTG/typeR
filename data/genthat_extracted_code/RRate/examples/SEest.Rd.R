library(RRate)


### Name: SEest
### Title: Estimating standard error of the observed log-odds ratio
### Aliases: SEest

### ** Examples

##Load data
data('smryStats1')        #Example of summary statistics in 1st study
n2.0<-2000                #Number of individuals in control group
n2.1<-2000                #Number of individuals in case group

SE2<-SEest(n2.0, n2.1, smryStats1$F_U, smryStats1$F_A) #SE in replication study



