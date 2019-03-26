library(ccaPP)


### Name: diabetes
### Title: Diabetes data
### Aliases: diabetes
### Keywords: datasets

### ** Examples

data("diabetes")
x <- diabetes$x
y <- diabetes$y

## Spearman correlation
maxCorGrid(x, y, method = "spearman")
maxCorGrid(x, y, method = "spearman", consistent = TRUE)

## Pearson correlation
maxCorGrid(x, y, method = "pearson")



