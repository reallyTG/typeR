library(wql)


### Name: plotTs
### Title: Time series plot
### Aliases: plotTs
### Keywords: Graphics ts

### ** Examples


# Chlorophyll at 4 stations in SF Bay
chl <- sfbayChla[, 1:4]
plotTs(chl, dot.size = 1.5, ylab = 'Chl-a', strip.labels = paste('Station',
  substring(colnames(chl), 2, 3)), ncol = 1, scales = "free_y")




