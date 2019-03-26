library(RInSp)


### Name: WTcMC
### Title: Monte Carlo resampling of WIC/TNW for the continuous case
### Aliases: WTcMC
### Keywords: univar models

### ** Examples

# Example of analysis with the trout data from Finland
data(Trout)
TroutRIS= import.RInSp(Trout, col.header=TRUE, row.names=1, info.cols=2, data.type="double")
# Warning, the number of replicates is set low to speed up he example!
# Note, for real analyses we recommend to set replicates => 999
TroutRIS_MC = WTcMC(TroutRIS, replicates = 99)
sumMC.RInSp(TroutRIS_MC)
rm(list=ls(all=TRUE))



