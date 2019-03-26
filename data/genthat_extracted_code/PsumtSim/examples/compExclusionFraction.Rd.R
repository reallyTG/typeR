library(PsumtSim)


### Name: compExclusionFraction
### Title: Compute fraction of cells with category selective response which
###   are excluded by pre-testing.
### Aliases: compExclusionFraction
### Keywords: datagen

### ** Examples

# This set of rates and alphas will exclude approximately 62% of neurons with 
# an effect of category on firing rates.
compExclusionFraction(10,c(10,9.5,10.5),5,
	pretestP=0.01,anovaP=0.05,showProgress=TRUE)



