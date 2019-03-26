library(RPPanalyzer)


### Name: calcLogistic
### Title: Calculates sample concentrations using sigmoid model fit
### Aliases: calcLogistic
### Keywords: manip

### ** Examples

library(RPPanalyzer)
data(ser.dil.samples)

predicted.data <- calcLogistic(ser.dil.samples, sample.id=c("sample","sample.n"),
dilution="dilution")



