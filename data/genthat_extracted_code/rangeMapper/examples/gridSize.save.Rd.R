library(rangeMapper)


### Name: gridSize.save
### Title: Save or retrieve the grid size from an 'rangeMapper' project.
### Aliases: gridSize.save gridSize.save, gridSize.fetch gridSize.fetch

### ** Examples

wd = tempdir()
dbcon = rangeMap.start(file = "test.sqlite", overwrite = TRUE, dir = wd )
global.bbox.save(con = dbcon)
gridSize.save(dbcon, gridSize = 2)

dbcon = rangeMap.start(file = "test.sqlite", overwrite = TRUE, dir = wd )
global.bbox.save(con = dbcon)
gridSize.save(dbcon)
gridSize.fetch(dbcon) #default grid size value



