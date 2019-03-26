library(rangeMapper)


### Name: canvas.save
### Title: Project's canvas
### Aliases: canvas.save canvas.fetch

### ** Examples

wd = tempdir()
dbcon = rangeMap.start(file = "test.sqlite", overwrite = TRUE, dir = wd)
global.bbox.save(con = dbcon)
gridSize.save(dbcon, gridSize = 2)
canvas.save(dbcon)
cnv = canvas.fetch(dbcon)
summary(cnv)
plot(cnv, col = 'grey', axes = TRUE)




