library(paleoMAS)


### Name: bcrossv.l1
### Title: LOESS regression bootstrap cross-validation with fixed
###   parameters
### Aliases: bcrossv.l1
### Keywords: models robust

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
# Cross-validation for Pinus
bcrossv.l1(modernq[,1],perq[,3])



