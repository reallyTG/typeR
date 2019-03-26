library(paleoMAS)


### Name: bcrossv.l
### Title: LOESS regression parameters selection through bootstrap
###   cross-validation for one taxon
### Aliases: bcrossv.l
### Keywords: models robust

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
# Cross-validation for Pinus
bcrossv.l(modernq[,1],perq[,3],trials=c(10,0.1))




