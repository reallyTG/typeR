library(BEST)


### Name: BESTpower
### Title: Estimating statistical power
### Aliases: BESTpower

### ** Examples


## For retrospective power analysis, see the example in BEST-package.

# 1. Generate idealised data set:
proData <- makeData(mu1=108, sd1=17, mu2=100, sd2=15, nPerGrp=20, 
                         pcntOut=10, sdOutMult=2.0, rnd.seed=NULL)
## No test: 
# 2. Generate credible parameter values from the idealised data:
proMCMC <- BESTmcmc(proData$y1, proData$y2, numSavedSteps=2000)  

# 3. Compute the prospective power for planned sample sizes:
# We'll  do just 5 simulations to show it works; should be several hundred.
N1plan <- N2plan <- 50
powerPro <- BESTpower(proMCMC, N1=N1plan, N2=N2plan,
               ROPEm=c(-1.5,1.5), ROPEsd=c(-2,2), ROPEeff=c(-0.5,0.5), 
               maxHDIWm=15.0, maxHDIWsd=10.0, maxHDIWeff=1.0, nRep=5)
powerPro
## End(No test)



