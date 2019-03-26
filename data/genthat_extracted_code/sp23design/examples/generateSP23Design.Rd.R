library(sp23design)


### Name: generateSP23Design
### Title: Generate a seamless Phase II-III design object given some the
###   true parameters and clinical trial parameters
### Aliases: generateSP23Design
### Keywords: design

### ** Examples

## trial parameters in paper
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

## Case C of table 1 in paper
caseC.TrueParameters <- list(p0 = 0.3,
                             p1 = 0.6,
                             pdiffHyp=0.3,
                             theta = list(
                               alpha = 0,
                               beta = 0,
                               gamma = 0),
                             baselineLambda = 0.35,
                             etaHyp = 0.25)


## Do case C as example
sp23Design <- generateSP23Design(caseC.TrueParameters, trialParameters)



