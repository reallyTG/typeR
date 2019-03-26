library(DTComPair)


### Name: dlr.regtest
### Title: Differences in Diagnostic Likelihood Ratios
### Aliases: dlr.regtest

### ** Examples

data(Paired1) # Hypothetical study data
ptab <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
ptab
dlr.results <- dlr.regtest(ptab)
str(dlr.results)
dlr.results



