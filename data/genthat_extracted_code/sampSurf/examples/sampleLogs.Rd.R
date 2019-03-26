library(sampSurf)


### Name: sampleLogs
### Title: Generates a Synthetic Population of Down Log Attributes
### Aliases: sampleLogs
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
#  draw from a unit square...
#
sampleLogs(species=c('ewp','sm','978'),buttDiams=c(1,10), logLens=c(3,6))
#
# draw from a buffer...
#
bufftr = bufferedTract(10, Tract(c(x=50,y=50),cellSize=0.5))
sl = sampleLogs(10, sampleRect=bufftr@bufferRect, buttDiams=c(25,40))
dlogs = downLogs(sl)
plot(bufftr, axes=TRUE, gridColor='grey80')
plot(dlogs, add=TRUE)



