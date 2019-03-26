library(discharge)


### Name: annualExtremes
### Title: Calculate annual extreme flows.
### Aliases: annualExtremes

### ** Examples

data(sycamore)
sycamore.flows<-asStreamflow(sycamore,river.name="Sycamore Creek")
syc.extremes<-annualExtremes(sycamore.flows)
names(syc.extremes)
syc.extremes$annual.max[1:3,]




