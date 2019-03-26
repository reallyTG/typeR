library(surveillance)


### Name: algo.hmm
### Title: Hidden Markov Model (HMM) method
### Aliases: algo.hmm
### Keywords: classif

### ** Examples

#Simulate outbreak data from HMM
set.seed(123)
counts <- sim.pointSource(p = 0.98, r = 0.8, length = 3*52,
                              A = 1, alpha = 1, beta = 0, phi = 0,
                              frequency = 1, state = NULL, K = 1.5)

## Not run: 
##D #Do surveillance using a two state HMM without trend component and
##D #the effect of the harmonics being the same in both states. A sliding
##D #window of two years is used to fit the HMM
##D surv <- algo.hmm(counts, control=list(range=(2*52):length(counts$observed),
##D                                    Mtilde=2*52,noStates=2,trend=FALSE,
##D                                    covEffectsEqual=TRUE,extraMSMargs=list()))
##D plot(surv,legend=list(x="topright"))
## End(Not run)

if (require("msm")) {
#Retrospective use of the function, i.e. monitor only the last time point
#but use option saveHMMs to store the output of the HMM fitting
surv <- algo.hmm(counts,control=list(range=length(counts$observed),Mtilde=-1,noStates=2,
                          trend=FALSE,covEffectsEqual=TRUE, saveHMMs=TRUE))

#Compute most probable state using the viterbi algorithm - 1 is "normal", 2 is "outbreak".
viterbi.msm(surv$control$hmm[[1]])$fitted

#How often correct?
tab <- cbind(truth=counts$state + 1 ,
             hmm=viterbi.msm(surv$control$hmm[[1]])$fitted)
table(tab[,1],tab[,2])
}



