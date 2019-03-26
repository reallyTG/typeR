library(geophys)


### Name: randFRY
### Title: Random data for Fry analysis
### Aliases: randFRY
### Keywords: misc

### ** Examples


RDAT = randFRY(100, LIM=c(0,0, 100, 100) , rlen=5   )
length(RDAT$x)
plot(RDAT$x, RDAT$y, asp=1, pch=".", cex=2)





