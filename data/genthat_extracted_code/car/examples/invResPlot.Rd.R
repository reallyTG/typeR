library(car)


### Name: invResPlot
### Title: Inverse Response Plots to Transform the Response
### Aliases: invResPlot inverseResponsePlot inverseResponsePlot.lm
### Keywords: hplot regression

### ** Examples

m2 <- lm(rate ~ log(len) + log(adt) + slim + shld + log(sigs1), Highway1)
invResPlot(m2)



