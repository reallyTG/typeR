library(FactoMineR)


### Name: plot.CA
### Title: Draw the Correspondence Analysis (CA) graphs
### Aliases: plot.CA
### Keywords: dplot

### ** Examples

data(children)
res.ca <- CA (children, col.sup = 6:8, row.sup = 15:18)
## select rows and columns that have a cos2 greater than 0.8
plot(res.ca,selectCol="cos2 0.8",selectRow="cos2 0.8")



