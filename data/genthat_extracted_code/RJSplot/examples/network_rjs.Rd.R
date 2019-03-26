library(RJSplot)


### Name: network_rjs
### Title: Produce interactive network graph
### Aliases: network_rjs

### ** Examples

## Create an interactive network graph in the folder "Network" of your local machine
## Live examples on http://rjsplot.net
# Prepare data
x <- 1-cor(t(mtcars))

source <- rep(rownames(x),nrow(x))
target <- rep(rownames(x),rep(ncol(x),nrow(x)))
links <- data.frame(source=source,target=target,value=as.vector(x))

# Generate the network graph
network_rjs(links[links[,3]>0.1,], mtcars, group = "cyl", size = "hp", color = "mpg")



