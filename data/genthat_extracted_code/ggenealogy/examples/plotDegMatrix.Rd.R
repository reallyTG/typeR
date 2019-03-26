library(ggenealogy)


### Name: plotDegMatrix
### Title: Returns the image object to show the heat map of degrees between
###   the inputted set of vertices
### Aliases: plotDegMatrix

### ** Examples

data(sbGeneal)
ig <- dfToIG(sbGeneal)
varieties <- c("Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p <- plotDegMatrix(varieties, ig, sbGeneal)
p + ggplot2::scale_fill_continuous(low = "white", high = "darkgreen")




