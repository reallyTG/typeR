library(FactoClass)


### Name: plotct
### Title: Row and Column Profiles of a Contingency Table
### Aliases: plotct
### Keywords: hplot

### ** Examples

mycolors<-colors()[c(1,26,32,37,52,57,68,73,74,81,82,84,88,100)]
data(Bogota)
plotct(Bogota[,2:7],col=mycolors)
# return tables with marginals
tabs <- plotct(Bogota[,2:7],col=mycolors,tables=TRUE,nd=0)



