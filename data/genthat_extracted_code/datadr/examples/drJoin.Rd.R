library(datadr)


### Name: drJoin
### Title: Join Data Sources by Key
### Aliases: drJoin

### ** Examples

bySpecies <- divide(iris, by = "Species")
# get independent lists of just SW and SL
sw <- drLapply(bySpecies, function(x) x$Sepal.Width)
sl <- drLapply(bySpecies, function(x) x$Sepal.Length)
drJoin(Sepal.Width = sw, Sepal.Length = sl, postTransFn = as.data.frame)




