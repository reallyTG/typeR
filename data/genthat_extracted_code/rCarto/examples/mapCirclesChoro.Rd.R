library(rCarto)


### Name: mapCirclesChoro
### Title: Proportional Circles Colored by a Discretized Quantitative
###   Variable
### Aliases: mapCirclesChoro

### ** Examples

library(rCarto)
data(mtq)

# minimal example
mtq$POPVAR <- (mtq$P09_POP-mtq$P99_POP) / mtq$P99_POP
mapCirclesChoro(shpFile=file.path(path.package("rCarto"), "shapes/COMMUNE"),
                shpId="INSEE_COM",df=mtq,dfId="ID",var="P09_POP",var2="POPVAR")



