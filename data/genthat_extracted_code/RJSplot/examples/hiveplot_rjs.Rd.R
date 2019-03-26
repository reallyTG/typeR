library(RJSplot)


### Name: hiveplot_rjs
### Title: Produce interactive hive plot
### Aliases: hiveplot_rjs

### ** Examples

## Create an interactive hive plot in the folder "HivePlot" of your local machine
## Live examples on http://rjsplot.net
# Prepare data
x <- 1-cor(t(mtcars))

source <- rep(rownames(x),nrow(x))
target <- rep(rownames(x),rep(ncol(x),nrow(x)))
links <- data.frame(source=source,target=target,value=as.vector(x))

# Generate the hive plot
hiveplot_rjs(links, mtcars, group = "cyl", size = "wt", color = "carb")



