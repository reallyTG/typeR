library(RJSplot)


### Name: heatmap_rjs
### Title: Produce an interactive heatmap.
### Aliases: heatmap_rjs

### ** Examples

## Create an interactive heatmap in the folder "Heatmap" of your local machine
## Live examples on http://rjsplot.net
metadata <- data.frame(phenotype1 = sample(c("yes","no"),ncol(mtcars),TRUE),
                       phenotype2 = sample(1:5,ncol(mtcars),TRUE))

heatmap_rjs(data.matrix(mtcars), metadata, scale="column")



