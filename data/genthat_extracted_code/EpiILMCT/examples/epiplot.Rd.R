library(EpiILMCT)


### Name: epiplot
### Title: Epidemic summary plots
### Aliases: epiplot
### Keywords: plot

### ** Examples

## network-based SIR ILMs:
data(NetworkData)
epiplot(type="SIR",kerneltype="network",epidat=NetworkData$epi,
		location=NetworkData$loc,network=NetworkData$net,
		plottype="propagation",time.index=seq(1,33,by=6))
epiplot(type="SIR",kerneltype="network",epidat=NetworkData$epi,
		location=NetworkData$loc,network=NetworkData$net,
		plottype="history")
## network-based SINR ILMs:
data(NetworkDataSINR)
epiplot(type="SINR",kerneltype="network",epidat=NetworkDataSINR$epi,
		location=NetworkDataSINR$loc,network=NetworkDataSINR$net,
		plottype="propagation",time.index=seq(1,34,by=6))
epiplot(type="SINR",kerneltype="network",epidat=NetworkDataSINR$epi,
		location=NetworkDataSINR$loc,network=NetworkDataSINR$net,
		plottype="history")
## distance-based SIR ILMs:
data(SpatialData)
epiplot(type="SIR",kerneltype="distance",epidat=SpatialData$epi,
		location=SpatialData$loc,plottype="propagation",
		time.index=seq(1,33,by=6))
epiplot(type="SIR",kerneltype="distance",epidat=SpatialData$epi,
		location=SpatialData$loc,plottype="history")
## distance and network-based SIR ILMs:
data(SpatialNetData)
epiplot(type="SIR",kerneltype="both",epidat=SpatialNetData$epi,
		location=SpatialNetData$loc,network= SpatialNetData $net,
		plottype="propagation",time.index=seq(1,21,by=6))
epiplot(type="SIR",kerneltype="both",epidat=SpatialNetData$epi,
		location=SpatialNetData$loc,network= SpatialNetData $net,
		plottype="history")



