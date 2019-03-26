library(discharge)


### Name: independentEvents
### Title: Independent high- or low-flow events
### Aliases: independentEvents
### Keywords: datasets

### ** Examples

data(sycamore)
syc.sf<-asStreamflow(sycamore)
#find 10-year flood
q10<-lp3Events(syc.sf)$Q10

#find all events greater than 10-year flood
independentEvents(q10,syc.sf$data, data.col=8 , below.cutoff=FALSE)



