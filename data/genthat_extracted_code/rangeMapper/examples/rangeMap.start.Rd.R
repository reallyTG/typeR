library(rangeMapper)


### Name: rangeMap
### Title: Initiate/open a new rangeMapper project
### Aliases: rangeMap rangeMap.start rangeMap.open

### ** Examples


td = setwd(tempdir())

dbcon = rangeMap.start(file = "test.sqlite", overwrite = TRUE, dir = tempdir() )
summary(dbcon)

summary(rangeMap("test.sqlite"))

dbcon = rangeMap.open(path = "test.sqlite")
summary(dbcon)
setwd(td)





