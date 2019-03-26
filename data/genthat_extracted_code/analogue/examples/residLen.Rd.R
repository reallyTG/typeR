library(analogue)


### Name: residLen
### Title: Squared residual length diagnostics
### Aliases: residLen print.residLen fittedY sqrlLinear sqrlUnimodal
### Keywords: methods multivariate

### ** Examples

## load the Imbrie and Kipp example data
data(ImbrieKipp, SumSST, V12.122)

## squared residual lengths for Core V12.122
rlens <- residLen(ImbrieKipp, SumSST, V12.122)
rlens

## as before but using linear RDA
residLen(ImbrieKipp, SumSST, V12.122, method = "rda")



