library(ggenealogy)


### Name: plotAncDes
### Title: Returns the image object to show the ancestors and descendants
###   of a variety
### Aliases: plotAncDes

### ** Examples

data(sbGeneal)
plotAncDes("Tokyo", sbGeneal, vColor = "red")
plotAncDes("Essex", sbGeneal, 2, 3, "blue") + ggplot2::labs(x = "Generation index", y = "")



