library(xRing)


### Name: getBorders
### Title: Get Tree-Ring Borders
### Aliases: getBorders

### ** Examples


data("PaPiRaw")
data("PaPiSpan")
AFO1001a <- toxRing(PaPiRaw, PaPiSpan, "AFO1001a")
AFO1001a <- getBorders(AFO1001a)

AFO1001a <- toxRing(PaPiRaw, seriesName = "AFO1001a")
AFO1001a <- getBorders(AFO1001a)





