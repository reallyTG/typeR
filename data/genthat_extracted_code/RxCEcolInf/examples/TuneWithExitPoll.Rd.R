library(RxCEcolInf)


### Name: TuneWithExitPoll
### Title: Tuning Function for Ecological Inference for Sets of R x C
###   Contingency Tables When Incorporating a Survey such as an Exit Poll
### Aliases: TuneWithExitPoll
### Keywords: models

### ** Examples

## Not run: 
##D SimData <- gendata.ep()    #  simulated data
##D FormulaString <- "Dem, Rep, Abs ~ bla, whi, his"
##D EPInvTune <-  TuneWithExitPoll(fstring = FormulaString,
##D                                data = SimData$GQdata,
##D                                exitpoll=SimData$EPInv$returnmat.ep,
##D                                num.iters = 10000,
##D                                num.runs = 15)
## End(Not run)



