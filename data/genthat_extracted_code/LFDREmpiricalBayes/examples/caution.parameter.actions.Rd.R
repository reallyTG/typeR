library(LFDREmpiricalBayes)


### Name: caution.parameter.actions
### Title: Based on a Decision-Theoretic Approach, Performs a Multiple
###   Hypothesis Testing Problem under a Zero-One Loss Function
### Aliases: caution.parameter.actions
### Keywords: Local False Discovery Rate Caution Gamma Minimax Caution
###   Gamma Minimin Caution-Type Estimators Null Hypothesis Bayes Action
###   Threshold Loss Values Decision-Theoretic Method

### ** Examples

#LFDR reference class values generated

#First reference class (separate class)
LFDR.Separate <- c(.14,.8,.251,.30)
#Second reference class (combined class)
LFDR.Combined <- c(.21,.61,.0888,.10)

# Default threshold at (20%).
output <- caution.parameter.actions(x1=LFDR.Separate, x2=LFDR.Combined)

# Three caution cases
output




