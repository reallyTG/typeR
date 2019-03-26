library(sp23design)


### Name: analyzeSP23Design
### Title: Analyses the results of running a design. If a trial history,
###   such as the result of the function 'executeSP23Design' or a history
###   of the actual conduct of a single trial is provided, it returns the
###   analysis results.
### Aliases: analyzeSP23Design
### Keywords: design

### ** Examples

## Not run: 
##D   catn <- function(...) cat(..., "\n")
##D 
##D   trialParameters <- list(minimumNumberOfEvents = 20,
##D                           minimumIncreaseInV = 0.2,
##D                           numberRecruitedEachYear = c(80, 120, 160, 160),
##D                           followupTime = 3,
##D                           adminCensoringTime = 7,
##D                           interimLookTime = c(1, 2, 3, 5, 7),
##D                           type1ErrorForResponse = 0.05,
##D                           type2ErrorForResponse = 0.01,
##D                           glrBoundarySidedness = "one", # one sided or two-sided
##D                           type1Error = 0.05,
##D                           type2Error = 0.10,
##D                           epsType1 = 1/3,
##D                           epsType2 = 1/3)
##D 
##D   trueParameters <- list(p0 = 0.3,
##D                          p1 = 0.3,
##D                          pdiffHyp=0.3,
##D                          theta = list(
##D                              alpha = 0,
##D                              beta = 0,
##D                              gamma = 0),
##D                          baselineLambda = 0.35,
##D                          etaHyp = 0.25)
##D   rngSeed <- 9872831
##D   sp23Design <- generateSP23Design(trueParameters, trialParameters)
##D   print(sp23Design)
##D   trialHistory <- exploreSP23Design(sp23Design, numberOfSimulations=25, rngSeed=rngSeed)
##D   result <- analyzeSP23Design(sp23Design, trialHistory)$designSummary
##D   catn("numberOfTimesH0RIsRejectedAtFirstLook",result[["numberOfTimesH0RIsRejectedAtFirstLook"]])
##D   catn("numberOfTimesH0RIsRejected", result[["numberOfTimesH0RIsRejected"]])
##D   catn("numberOfTimesStoppedForFutility", result[["numberOfTimesStoppedForFutility"]])
##D   catn("numberOfTimesH0SIsAccepted", result[["numberOfTimesH0SIsAccepted"]])
##D   catn("numberOfTimesH0SIsRejected", result[["numberOfTimesH0SIsRejected"]])
##D   catn("numberOfTimesFutilityDecidedAtLastLook",result[["numberOfTimesFutilityDecidedAtLastLook"]])
##D   catn("numberOfTimesTrialEndedAtLook", result[["numberOfTimesTrialEndedAtLook"]])
##D   catn("avgExitTime", result[["avgExitTime"]])
## End(Not run)




