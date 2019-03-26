library(RxCEcolInf)


### Name: gendata.ep
### Title: Function To Simulate Ecological and Survey Data For Use in
###   Testing And Analyzing Other Functions in Package
### Aliases: gendata.ep

### ** Examples

## Not run: 
##D SimData <- gendata.ep()    #  simulated data
##D FormulaString <- "Dem, Rep, Abs ~ bla, whi, his"
##D EPInvTune <-  TuneWithExitPoll(fstring = FormulaString,
##D                                data = SimData$GQdata,
##D                                exitpoll=SimData$EPInv$returnmat.ep,
##D                                num.iters = 10000,
##D                                num.runs = 15)
##D EPInvChain1 <- AnalyzeWithExitPoll(fstring = FormulaString,
##D                                    data = SimData$GQdata,
##D                                    exitpoll=SimData$EPInv$returnmat.ep,
##D                                    num.iters = 2000000,
##D                                    burnin = 200000,
##D                                    save.every = 2000,
##D                                    rho.vec = EPInvTune$rhos,
##D                                    print.every = 20000,
##D                                    debug = 1,
##D                                    keepTHETAS = 0,
##D                                    keepNNinternals = 0)
##D EPInvChain2 <- AnalyzeWithExitPoll(fstring = FormulaString,
##D                                    data = SimData$GQdata,
##D                                    exitpoll=SimData$EPInv$returnmat.ep,
##D                                    num.iters = 2000000,
##D                                    burnin = 200000,
##D                                    save.every = 2000,
##D                                    rho.vec = EPInvTune$rhos,
##D                                    print.every = 20000,
##D                                    debug = 1,
##D                                    keepTHETAS = 0,
##D                                    keepNNinternals = 0)
##D EPInvChain3 <- AnalyzeWithExitPoll(fstring = FormulaString,
##D                                    data = SimData$GQdata,
##D                                    exitpoll=SimData$EPInv$returnmat.ep,
##D                                    num.iters = 2000000,
##D                                    burnin = 200000,
##D                                    save.every = 2000,
##D                                    rho.vec = EPInvTune$rhos,
##D                                    print.every = 20000,
##D                                    debug = 1,
##D                                    keepTHETAS = 0,
##D                                    keepNNinternals = 0)
##D EPInv <- mcmc.list(EPInvChain1, EPInvChain2, EPInvChain3)
## End(Not run)



