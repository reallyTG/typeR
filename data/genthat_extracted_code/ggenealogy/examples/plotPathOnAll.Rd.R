library(ggenealogy)


### Name: plotPathOnAll
### Title: Plot a path between two vertices over the full genealogy
### Aliases: plotPathOnAll

### ** Examples

data(sbGeneal)
sb <- sbGeneal[complete.cases(sbGeneal[1:3]),]
ig <- dfToIG(sb)
pathCL <- getPath("Clark", "Lawrence", ig, sb, "yield")
plotPathOnAll(pathCL, sb, ig, "yield", bin = 3, pathEdgeCol = "red") + ggplot2::xlab("Yield")
plotPathOnAll(pathCL, sb, ig, "yield", "devYear") + ggplot2::xlab("Yield") + ggplot2::ylab("Year")



