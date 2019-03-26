library(hyfo)


### Name: getAnnual
### Title: Get annual rainfall of different rainfall time series
### Aliases: getAnnual getAnnual,data.frame-method getAnnual,list-method

### ** Examples

#datalist is provided by the package as a test.
data(testdl)
a <- getAnnual(testdl)
#set minRecords to control the calculation of annual rainfall.
b <- getAnnual(testdl, output = 'mean', minRecords = 350)
c <- getAnnual(testdl, output = 'mean', minRecords = 365)

a1 <- extractPeriod(testdl, comm = TRUE)
a2 <- list2Dataframe(a1)
getAnnual(a2)

a3 <- fillGap(a2)
getAnnual(a3)


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




