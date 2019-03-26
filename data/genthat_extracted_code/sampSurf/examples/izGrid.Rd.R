library(sampSurf)


### Name: izGrid
### Title: Generate Objects of Class "'InclusionZoneGrid'"
### Aliases: izGrid
### Keywords: ~kwd1 ~kwd2

### ** Examples

tr = Tract(c(x=20,y=20), cellSize=0.5)
btr = bufferedTract(5, tr)
dlogs = downLogs(1, btr@bufferRect)
sup = standUpIZ(dlogs@logs$log.1, 2)
izgSU = izGrid(sup, btr)
plot(izgSU, axes=TRUE)
izgSU



