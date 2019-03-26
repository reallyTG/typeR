library(sp23design)


### Name: resetSP23Design
### Title: Reset the design object so that counts and results are zeroed
###   out
### Aliases: resetSP23Design
### Keywords: design

### ** Examples

## Not run: 
##D   trialParameters <- list(minimumNumberOfEvents = 20,
##D                       minimumIncreaseInV = 0.2,
##D                       numberRecruitedEachYear = c(80, 120, 160, 160),
##D                       followupTime = 3,
##D                       adminCensoringTime = 7,
##D                       interimLookTime = c(1, 2, 3, 5, 7),
##D                       type1ErrorForResponse = 0.05,
##D                       type2ErrorForResponse = 0.01,
##D                       glrBoundarySidedness = "one", # one sided or two-sided
##D                       type1Error = 0.05,
##D                       type2Error = 0.10,
##D                       epsType1 = 1/3,
##D                       epsType2 = 1/3)
##D 
##D   ## Case C of table 1 in paper
##D   caseC.TrueParameters <- list(p0 = 0.3,
##D                                p1 = 0.6,
##D                                pdiffHyp=0.3,
##D                                theta = list(
##D                                    alpha = 0,
##D                                    beta = 0,
##D                                    gamma = 0),
##D                                baselineLambda = 0.35,
##D                                etaHyp = 0.25)
##D 
##D 
##D   ## Do case C as example
##D   sp23Design <- generateSP23Design(caseC.TrueParameters, trialParameters)
##D   ## do something ...
##D   sp23Design <- resetSP23Design(sp23Design)
## End(Not run)



