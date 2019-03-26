library(FrF2)


### Name: aliases
### Title: Alias structure for fractional factorial 2-level designs
### Aliases: aliases aliasprint print.aliases
### Keywords: design

### ** Examples

    ### Injection Molding Experiment. Box et al. 1978.
    data(BM93.e3.data, package="BsMD")  #from BsMD
    iMdat <- BM93.e3.data[1:16,2:10]  #only original experiment
    # make data more user-friendly
    colnames(iMdat) <- c("MoldTemp","Moisture","HoldPress","CavityThick",
             "BoostPress","CycleTime","GateSize","ScrewSpeed","y")
    # determine aliases with all 2-factor-interactions
    aliases(lm(y ~ (.)^2, data = iMdat))
    # coded version
    aliases(lm(y ~ (.)^2, data = iMdat), code=TRUE)
    # determine aliases with all 3-factor-interactions
    aliases(lm(y ~ (.)^3, data = iMdat), code=TRUE)
    # show condensed form
    aliases(lm(y ~ (.)^3, data = iMdat), code=TRUE, condense=TRUE)
    # determine aliases for unaliased model
    aliases(lm(y ~ ., data = iMdat))



