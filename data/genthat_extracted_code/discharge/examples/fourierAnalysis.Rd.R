library(discharge)


### Name: fourierAnalysis
### Title: Extract seasonal signal from time series
### Aliases: fourierAnalysis plot.ssignal summary.ssignal

### ** Examples

data(sycamore)
sycamore.flows<-asStreamflow(sycamore,river.name="Sycamore Creek")
syc.seas<-fourierAnalysis(sycamore.flows)
summary(syc.seas)



