library(RPPanalyzer)


### Name: calcLinear
### Title: Calculates sample concentrations using linear model fit
### Aliases: calcLinear
### Keywords: manip

### ** Examples

library(RPPanalyzer)
data(ser.dil.samples)

predicted.data <- calcLinear(ser.dil.samples,sample.id=c("sample","sample.n"),
dilution="dilution")



