library(wql)


### Name: plotTsTile
### Title: Image plot of monthly time series
### Aliases: plotTsTile
### Keywords: hplot ts

### ** Examples


# plot log-anomalies in four bins
chl27 = sfbayChla[, 's27']
plotTsTile(chl27, legend.title = 'Chl log-anomaly')

# plot deciles
plotTsTile(chl27, plot.title = 'SF Bay station 27', legend.title =
	'chlorophyll', four = FALSE, loganom = FALSE, square = FALSE)




