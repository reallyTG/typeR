library(LFDREmpiricalBayes)


### Name: PRGM.action
### Title: Based on the Robust Bayes Approach, Performs a Multiple
###   Hyothesis Testing Problem under an Squared Error Loss Function
### Aliases: PRGM.action
### Keywords: Posterior Regret Gamma Minimax Average

### ** Examples

#LFDR reference class values generated

#First reference class
LFDR.Separate <- c(0.14, 0.8, 0.16, 0.30)
#Second reference class
LFDR.Combined <- c(0.21, 0.61, 0.12, 0.10)

output <- PRGM.action(LFDR.Separate, LFDR.Combined)

# Vector of the LFDR estimates
output




