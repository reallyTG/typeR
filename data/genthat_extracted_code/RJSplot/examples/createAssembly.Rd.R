library(RJSplot)


### Name: createAssembly
### Title: Creates a genome assembly for 'genomemap_rjs' or
###   'manhattan_rjs'.
### Aliases: createAssembly

### ** Examples

## Creates a fake genome assembly for its posterior use as parameter of genomemap or manhattan plot
## Live examples and full tutorial on http://rjsplot.net

## Generate a test assembly with three scaffolds
assembly <- createAssembly(c("scaffold1","scaffold2","scaffold3"), c(1000000,800000,650000))



