library(LFDREmpiricalBayes)


### Name: SEL.caution.parameter
### Title: Based on a Decision-Theoretic Approach, Performs a Multiple
###   Hyothesis Testing Problem under an Squared Error Loss Function
### Aliases: SEL.caution.parameter
### Keywords: Squared Error Loss Error Hypothesis Indicator

### ** Examples


#Similar to caution.parameter actions we have the following classes

#First reference class
LFDR.Separate <- c(0.14, 0.8, 0.16, 0.30)
#Second reference class
LFDR.Combined <- c(0.21, 0.61, 0.12, 0.10)

output <- SEL.caution.parameter(LFDR.Separate, LFDR.Combined)

# Three caution cases with SEL values.
output



