library(CityWaterBalance)


### Name: gapfillStreamflow
### Title: Fill gaps in streamflow records
### Aliases: gapfillStreamflow

### ** Examples

gages <- c('05551540', '05552500')
flow <- getStreamflow('2000-01-01', '2010-12-31', gages)
flow <- gapfillStreamflow(flow, list(c(gages[1], gages[2])))



