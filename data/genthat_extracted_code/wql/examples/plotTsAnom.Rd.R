library(wql)


### Name: plotTsAnom
### Title: Anomaly plot of time series
### Aliases: plotTsAnom
### Keywords: Graphics ts

### ** Examples


# Spring bloom size for 6 stations in SF Bay
bloom <- aggregate(sfbayChla[, 1:6], 1, meanSub, sub=3:5)
plotTsAnom(bloom, ylab = 'Chl-a', strip.labels = paste('Station',
  substring(colnames(bloom), 2, 3)), ncol = 2, scales = "free_y")




