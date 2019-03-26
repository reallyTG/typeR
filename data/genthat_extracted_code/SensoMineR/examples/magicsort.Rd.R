library(SensoMineR)


### Name: magicsort
### Title: Returns a sorted data matrix
### Aliases: magicsort
### Keywords: manip

### ** Examples

## Example 1
data(chocolates)
resdecat<-decat(sensochoc, formul = "~Product", firstvar = 5, 
    graph = FALSE)
coltable(magicsort(resdecat$tabT), level.lower = -1.96, 
    level.upper = 1.96, main.title = "Products' description")

## Example 2
data(chocolates)
resperf<-paneliperf(sensochoc, 
    formul = "~Product+Panelist+Product:Panelist",
    formul.j = "~Product", col.j = 1, firstvar = 5, lastvar = 12,
    synthesis = FALSE, graph = FALSE)
res.sort=magicsort(resperf$prob.ind, method = "median")
coltable(res.sort, main.title = "P-values of the F-test by panelist")



