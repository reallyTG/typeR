library(NPHMC)


### Name: NPHMC
### Title: An R-package for Estimating Sample Size and Power of
###   Proportional Hazards Mixture Cure Model
### Aliases: NPHMC
### Keywords: PH mixture cure model sample size power

### ** Examples


# parametric sample size calculation
NPHMC(power=0.90,alpha=0.05,accrualtime=3,followuptime=4,p=0.5,accrualdist="uniform",
hazardratio=2/2.5,oddsratio=2.25,pi0=0.1,survdist="exp",k=1,lambda0=0.5)

# nonparametric sample size calculation
data(e1684szdata)
NPHMC(power=0.80,alpha=0.05,accrualtime=4,followuptime=3,p=0.5,accrualdist="uniform",
data=e1684szdata)

# parametric power calculation
n=seq(100, 500, by=50)
NPHMC(n=n, alpha=0.05,accrualtime=3,followuptime=4,p=0.5,
accrualdist="uniform", hazardratio=2/2.5,oddsratio=2.25,pi0=0.1,survdist="exp",
k=1,lambda0=0.5)

# nonparametric power calculation
n=seq(100, 500, by=50)
NPHMC(n=n,alpha=0.05,accrualtime=4,followuptime=3,p=0.5, 
accrualdist="uniform",data=e1684szdata)



