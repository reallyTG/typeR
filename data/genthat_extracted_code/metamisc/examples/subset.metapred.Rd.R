library(metamisc)


### Name: subset.metapred
### Title: Subsetting metapred fits
### Aliases: subset.metapred

### ** Examples

data(DVTipd)
DVTipd$cluster <- letters[1:4] # Add a fictional clustering to the data.
mp <- metapred(DVTipd, strata = "cluster", formula = dvt ~ histdvt + ddimdich, family = binomial)
subset(mp) # best cross-validated model
subset(mp, select = "global") # Final model fitted on all strata.
subset(mp, step = 1) # The best model of step 1
subset(mp, step = 1, model = "histdvt") # The model in which histdvt was removed, in step 1.




