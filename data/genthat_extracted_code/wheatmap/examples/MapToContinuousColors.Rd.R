library(wheatmap)


### Name: MapToContinuousColors
### Title: map data to continuous color
### Aliases: MapToContinuousColors

### ** Examples

barplot(1:10, col=MapToContinuousColors(1:10)$colors)
barplot(1:20, col=MapToContinuousColors(c(1:10,10:1))$colors)



