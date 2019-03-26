library(hyfo)


### Name: plotTS
### Title: plot time series, with marks on missing value.
### Aliases: plotTS

### ** Examples

plotTS(testdl[[1]])
plotTS(testdl[[1]], x = 'xxx', y = 'yyy', title = 'aaa')

# If input is a datalist
plotTS(list = testdl)

# Or if you want to input time series one by one
# If plot = 'cum' then cumulative curve will  be plotted.
plotTS(testdl[[1]], testdl[[2]], plot = 'cum')

# You can also directly plot multicolumn dataframe
dataframe <- list2Dataframe(extractPeriod(testdl, commonPeriod = TRUE))
plotTS(dataframe, plot = 'cum')

# Sometimes you may want to process the dataframe and compare with the original one
dataframe1 <- dataframe
dataframe1[, 2:4] <- dataframe1[, 2:4] + 3
plotTS(dataframe, dataframe1, plot = 'cum')
# But note, if your input is a multi column dataframe, it's better to plot one using plotTS,
# and compare them using plotTS_comb. If all data are in one plot, there might be too messy.


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




