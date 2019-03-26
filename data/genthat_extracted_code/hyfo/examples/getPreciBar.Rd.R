library(hyfo)


### Name: getPreciBar
### Title: get mean rainfall bar plot of the input dataset or time series.
### Aliases: getPreciBar getPreciBar,list-method
###   getPreciBar,data.frame-method

### ** Examples

#gridData provided by package is the result of \code{loadNcdf()}
data(tgridData)
b1 <- getPreciBar(tgridData, method = 'annual')
b2 <- getPreciBar(tgridData, method = 'meanMonthly')

data(testdl)
TS  <- testdl[[1]]
a <- getPreciBar(TS, method = 'spring')
# if info = T, the information will be given at the bottom.
a <- getPreciBar(TS, method = 'spring', info = TRUE)


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




