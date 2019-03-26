library(LFDREmpiricalBayes)


### Name: ME.log
### Title: Provides Reliable LFDR Estimates by Selecting an Appropriate
###   Reference Class
### Aliases: ME.log
### Keywords: Maximum Entropy Method LFDR Estimation Maximum Likelihood
###   Reference Class Separate Reference Class Combined Reference Class
###   Maximum Likelihood Estimation

### ** Examples

#import the function ``lfdr.mle'' from package``LFDR.MLE''
library(LFDR.MLE)

#Consider a separate reference class and a combined reference class below:

n.SNPs.S<-3  # number of SNPs in the separate reference class
n.SNPs.Sc<-2 # number of SNPs in the complement of the separate reference class.

#Create a series of test statistics for SNPs in the separate reference class.
stat.Small<-rchisq(n.SNPs.S,df=1,ncp=0)
ncp.Sc<-10

#Create a series of test statistics for SNPs in the combined reference class.
stat.Big<-c(stat.Small,rchisq(n.SNPs.Sc,df=1,ncp=ncp.Sc))

#Using lfdr.mle, a series of arguments are used.
dFUN=dchisq; lower.ncp = .1; upper.ncp = 50;
lower.p0 = 0; upper.p0 = 1;

#Maximum Likelihood estimates for the LFDRs of SNPs in the created
# separate reference class.

#Separate reference class.
estimates.S<-lfdr.mle(x=stat.Small,dFUN=dchisq,df=1,lower.ncp = lower.ncp,
upper.ncp = upper.ncp)
LFDR.Small<-estimates.S$LFDR
p0.Small<-estimates.S$p0.hat
ncp.Small<-estimates.S$ncp.hat

# Maximum Likelihood estimates for the LFDRs of SNPs in the created combined
# reference class.
estimates.C<-lfdr.mle(x=stat.Big,dFUN=dchisq,df=1,lower.ncp = lower.ncp,
upper.ncp = upper.ncp)
LFDR.Big<-estimates.C$LFDR
p0.Big<-estimates.C$p0.hat
ncp.Big<-estimates.C$ncp.hat


#The first three values of the combined reference class correspond to the
#separate reference class in this example
LFDR.SBig<-LFDR.Big[1:3]

LFDR.ME<-ME.log(stat=stat.Small,lfdr.C=LFDR.SBig,p0.C=p0.Big,ncp.C=ncp.Big,
p0.S=p0.Small,ncp.S=ncp.Small)

LFDR.ME



