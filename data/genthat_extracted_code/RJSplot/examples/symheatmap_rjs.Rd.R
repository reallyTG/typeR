library(RJSplot)


### Name: symheatmap_rjs
### Title: Creates a Symetric Heatmap representation.
### Aliases: symheatmap_rjs

### ** Examples

## Create an interactive symetric heatmap in the folder "SymHeatmap" of your local machine
## Live examples on http://rjsplot.net
# prepare data
x <- 1-cor(t(mtcars))

source <- rep(rownames(x),nrow(x))
target <- rep(rownames(x),rep(ncol(x),nrow(x)))
links <- data.frame(source=source,target=target,value=as.vector(x))

# Create symetric heatmap
symheatmap_rjs(links, mtcars, group = "cyl")



