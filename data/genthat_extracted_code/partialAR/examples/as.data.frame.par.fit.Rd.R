library(partialAR)


### Name: as.data.frame.par.fit
### Title: Convert a fit of the PAR model to a single row data.frame
### Aliases: as.data.frame.par.fit
### Keywords: models ts

### ** Examples

## No test: 
    require(TTR)
    L <- getYahooData("L", 20120101, 20131231)$Close
    fit.par(L)
    as.data.frame(fit.par(L))
## End(No test)



