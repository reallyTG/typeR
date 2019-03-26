library(ggenealogy)


### Name: plotVariableMatrix
### Title: Returns the image object to show the heat map of dates between
###   the inputted set of vertices
### Aliases: plotVariableMatrix

### ** Examples

data(sbGeneal)
varieties <- c("Bedford", "Calland", "Narow", "Pella", "Tokyo", "Young", "Zane")
p <- plotVariableMatrix(varieties, sbGeneal, "devYear", "Variety", "Variety", "Difference")
p + ggplot2::scale_fill_continuous(low = "white", high = "darkgreen")




