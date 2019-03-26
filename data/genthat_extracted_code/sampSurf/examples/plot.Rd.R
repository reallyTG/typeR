library(sampSurf)


### Name: plot
### Title: Plot objects within package 'sampSurf'
### Aliases: plot
### Keywords: ~kwd1 ~kwd2

### ** Examples

tr = Tract(c(x=25,y=25), cellSize=0.5)
btr = bufferedTract(5, tr)
dlogs = downLogs(20, btr, buttDiams=c(25,35),logLens=c(3,10))
plot(btr, axes=TRUE, bufferColor='lightblue')
plot(dlogs, add=TRUE, showLogCenter=TRUE, logCenterColor='grey30', cex=2)



