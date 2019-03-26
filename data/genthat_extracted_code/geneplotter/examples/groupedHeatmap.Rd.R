library(geneplotter)


### Name: groupedHeatmap
### Title: Heatmap of a matrix with grouped rows and columns
### Aliases: groupedHeatmap

### ** Examples


data("mtcars")

groupedHeatmap(
  scale(mtcars),
  frow = factor(sapply(strsplit(rownames(mtcars), " "), "[", 1)),
  fcol = factor(round(seq_len(ncol(mtcars))/3)))



