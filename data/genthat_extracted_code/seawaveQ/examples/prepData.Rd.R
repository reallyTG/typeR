library(seawaveQ)


### Name: prepData
### Title: Prepares concentration data and continuous ancillary data
### Aliases: prepData
### Keywords: manip

### ** Examples

data(swData)
modMoRivOmaha<-combineData(qwdat=qwMoRivOmaha, cqwdat=cqwMoRivOmaha)
preppedDat <- prepData(modMoRivOmaha, cqwMoRivOmaha, yrstart=1995,
yrend=2003, dcol="dates", pnames=c("04035", "04037", "04041"),
iwcav=c("flowa30","flowa1"), qwcols=c("R","P"))



