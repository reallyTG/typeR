library(UBCRM)


### Name: UBCRM-package
### Title: UBCRM is a package containing functions to simulate and conduct
###   dose escalation phase I studies
### Aliases: UBCRM-package UBCRM
### Keywords: UBCRM

### ** Examples


data<- CreData(4)
prior<-c(.05,.1,.15,.2)

# One study simulation
simCrm(prior=prior, firstdose = 2, truerate = prior, cohortsize = 3, target = 1/3,
nptmax = 18, nmaxmtd = 6, nmaxdose = 18, sd = 1.34, approach = "bayes", model = "power",
method = "fpost", nextlevel = "ntarget", upskipping = TRUE, downskipping = FALSE,
lastdose = NA, graphic = FALSE, seed = 20130110)

# N simulations with CRM
# Power model, no up skipping, start at dose 2
res1<- ssimCrm(prior=prior, 100, firstdose = 2, truerate = prior, cohortsize = 3,
target = 1/3, nptmax = 18, nmaxmtd = 6, nmaxdose = 18, sd = 1.34, approach = "bayes",
method = "fpost", model = "power", nextlevel = "ntarget", upskipping = TRUE,
downskipping = FALSE, r = 2, seed=20130110)
res1

# Simulations with 3+3 design
res2<- ssim3p3(truerate=prior, 100, r = 2, seed=20130110)
res2



