library(sp23design)


### Name: generateClinicalTrialData
### Title: A function to generate some clinical trial data according the
###   joint model of response and survival for simulations
### Aliases: generateClinicalTrialData
### Keywords: design

### ** Examples

  trialParameters <- list(minimumNumberOfEvents = 20,
                              minimumIncreaseInV = 0.2,
                              numberRecruitedEachYear = c(80, 120, 160, 160),
                              followupTime = 3,
                              adminCensoringTime = 7,
                              interimLookTime = c(1, 2, 3, 5, 7),
                              type1ErrorForResponse = 0.05,
                              type2ErrorForResponse = 0.01,
                              glrBoundarySidedness = "one", # one sided or two-sided
                              type1Error = 0.05,
                              type2Error = 0.10,
                              epsType1 = 1/3,
                              epsType2 = 1/3)

  trueParameters <- list(p0 = 0.3,
                             p1 = 0.3,
                             pdiffHyp=0.3,
                             theta = list(
                                     alpha = 0,
                                     beta = 0,
                                     gamma = 0),
                             baselineLambda = 0.35,
                             etaHyp = 0.25)
  rngSeed <- 9872831

  d <- generateClinicalTrialData(nRec = trialParameters$numberRecruitedEachYear,
                                     nFUp = trialParameters$followupTime,
                                     pi0 = trueParameters$p0,
                                     pi1 = trueParameters$p1,
                                     theta = trueParameters$theta,
                                     lambda0 = trueParameters$baselineLambda)




