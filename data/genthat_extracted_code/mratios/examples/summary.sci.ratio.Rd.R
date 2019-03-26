library(mratios)


### Name: summary.sci.ratio
### Title: Summary function for sci.ratio
### Aliases: summary.sci.ratio summary.sci.ratio.gen
### Keywords: print

### ** Examples

data(BW)
RES <- sci.ratio(Weight~Dose, data=BW, type="Dunnett", alternative="greater")
summary(RES)



