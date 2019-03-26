library(ggenealogy)


### Name: plotPath
### Title: Construct the graphic object of the path
### Aliases: plotPath

### ** Examples

data(sbGeneal)
ig <- dfToIG(sbGeneal)
pathTN <- getPath("Tokyo", "Narow", sbIG, sbGeneal, "devYear")
plotPath(pathTN, sbGeneal, "devYear")

sbFilt <- sbGeneal[complete.cases(sbGeneal[1:3]),]
sbFiltIG <- dfToIG(sbFilt)
pathCL <- getPath("Clark", "Lawrence", sbFiltIG, sbFilt, "yield")
plotPath(pathCL, sbFilt, "devYear", "yield") + ggplot2::xlab("Dev Year") + ggplot2::ylab("Yield")



