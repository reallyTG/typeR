library(CityWaterBalance)


### Name: combineStreamflow
### Title: Combines streamflow records to estimate total flows
### Aliases: combineStreamflow

### ** Examples

gages <- c('05551540', '05552500')
flow <- getStreamflow('2000-01-01', '2010-12-31', gages)
flow <- gapfillStreamflow(flow, list(c(gages[1], gages[2])))
flow <- combineStreamflow(flow, c(0.5, 0.5))



