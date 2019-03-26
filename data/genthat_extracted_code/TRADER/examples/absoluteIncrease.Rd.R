library(TRADER)


### Name: absoluteIncrease
### Title: Analysis by Fraver & White 2005 called "absolute increase"
### Aliases: absoluteIncrease FraverWhite
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)

abs<-absIncrease(relData1)
mabs.threshold<- absTreshold(abs)
fw <- absoluteIncrease(relData1,abs,mabs.threshold)
plotRelease(relData1,abs,fw, 1, method="FraverWhite")



