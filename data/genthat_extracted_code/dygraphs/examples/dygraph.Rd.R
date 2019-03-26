library(dygraphs)


### Name: dygraph
### Title: dygraph interactive plot for time series data
### Aliases: dygraph

### ** Examples

library(dygraphs)
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths)

indoConc <- Indometh[Indometh$Subject == 1, c("time", "conc")]
dygraph(indoConc)




