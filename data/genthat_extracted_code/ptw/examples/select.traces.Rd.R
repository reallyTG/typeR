library(ptw)


### Name: select.traces
### Title: Select traces from a data set according to several criteria
### Aliases: select.traces
### Keywords: manip

### ** Examples

data(lcms)
ntrace <- dim(lcms)[1]
lcms.selection <- select.traces(lcms[,,1:2], criterion = "var")
good <- lcms.selection$trace.nrs[1]
bad <- lcms.selection$trace.nrs[ntrace]

par(mfrow = c(1,2))
matplot(lcms[good,,1:2], type = 'l', lty = 1)
matplot(lcms[bad,,1:2], type = 'l', lty = 1)



