library(TSS.RESTREND)


### Name: climate.accumulator
### Title: Climate Accumulator
### Aliases: climate.accumulator

### ** Examples

# Define the max accumuulation period
acp <- 12
#Define the max offset period
osp <- 4
rftable <- climate.accumulator(segRESTRENDCTSR$cts.NDVI, segRESTRENDctRF$precip, acp, osp)



