library(sp23design)


### Name: executeSP23Design
### Title: Given a design object, interim data and the current calendar
###   time, conduct the interim analysis for the time
### Aliases: executeSP23Design
### Keywords: design

### ** Examples

## Not run: 
##D   trialParameters <- list(minimumNumberOfEvents = 20,
##D                               minimumIncreaseInV = 0.2,
##D                               numberRecruitedEachYear = c(80, 120, 160, 160),
##D                               followupTime = 3,
##D                               adminCensoringTime = 7,
##D                               interimLookTime = c(1, 2, 3, 5, 7),
##D                               type1ErrorForResponse = 0.05,
##D                               type2ErrorForResponse = 0.01,
##D                               glrBoundarySidedness = "one", # one sided or two-sided
##D                               type1Error = 0.05,
##D                               type2Error = 0.10,
##D                               epsType1 = 1/3,
##D                               epsType2 = 1/3)
##D 
##D   trueParameters <- list(p0 = 0.3,
##D                              p1 = 0.3,
##D                              pdiffHyp=0.3,
##D                              theta = list(
##D                                      alpha = 0,
##D                                      beta = 0,
##D                                      gamma = 0),
##D                              baselineLambda = 0.35,
##D                              etaHyp = 0.25)
##D   rngSeed <- 9872831
##D 
##D   sp23Design <- generateSP23Design(trueParameters, trialParameters)
##D   d <- generateClinicalTrialData(nRec = trialParameters$numberRecruitedEachYear,
##D                                  nFUp = trialParameters$followupTime,
##D                                  pi0 = trueParameters$p0,
##D                                  pi1 = trueParameters$p1,
##D                                  theta = trueParameters$theta,
##D                                  lambda0 = trueParameters$baselineLambda)
##D   result <- executeSP23Design(sp23Design, d, trialParameters$interimLookTime[2])
## End(Not run)



