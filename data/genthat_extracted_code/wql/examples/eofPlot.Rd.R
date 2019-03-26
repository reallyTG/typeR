library(wql)


### Name: eofPlot
### Title: Plot EOF analysis results
### Aliases: eofPlot
### Keywords: Graphics

### ** Examples


# Create an annual matrix time series
chla1 <- aggregate(sfbayChla, 1, mean, na.rm = TRUE)
chla1 <- chla1[, 1:12]  # remove stations with missing years

# eofNum (see examples) suggests n = 1
e1 <- eof(chla1, n = 1)
eofPlot(e1, type = 'coef')
eofPlot(e1, type = 'amp')




