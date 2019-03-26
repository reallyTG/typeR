library(seawaveQ)


### Name: combineData
### Title: Combine water-quality sample data and continuous ancillary
###   variables
### Aliases: combineData
### Keywords: manip

### ** Examples

data(swData)
MoRivOmaha<-combineData(qwdat=qwMoRivOmaha, cqwdat=cqwMoRivOmaha,
qwcols=c("staid", "dates", "R", "P"))



