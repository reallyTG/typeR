library(RobAStBase)


### Name: interpolRisk-class
### Title: Interpolated Risks
### Aliases: interpolRisk-class OMSRRisk-class RMXRRisk-class MBRRisk-class
###   OMSRRisk RMXRRisk MBRRisk
### Keywords: classes

### ** Examples

new("OMSRRisk")
OMSRRisk()
RMXRRisk()
MBRRisk()
myrisk <- MBRRisk(samplesize=100)
samplesize(myrisk)
samplesize(myrisk) <- 20



