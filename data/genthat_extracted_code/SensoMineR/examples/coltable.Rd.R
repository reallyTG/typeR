library(SensoMineR)


### Name: coltable
### Title: Color the cells of a data frame according to 4 threshold levels
### Aliases: coltable
### Keywords: color

### ** Examples

## Example 1
data(chocolates)
resdecat<-decat(sensochoc, formul = "~Product+Panelist", firstvar = 5,
    graph = FALSE)
resaverage<-averagetable(sensochoc, formul = "~Product+Panelist", 
    firstvar = 5)
resaverage.sort = resaverage[rownames(magicsort(resdecat$tabT)),
    colnames(magicsort(resdecat$tabT))]
coltable(resaverage.sort, magicsort(resdecat$tabT), 
    level.lower = -1.96, level.upper = 1.96,
    main.title = "Average by chocolate")

## Example 3
## Not run: 
##D data(chocolates)
##D resperf<-paneliperf(sensochoc, 
##D     formul = "~Product+Panelist+Product:Panelist", 
##D     formul.j = "~Product", col.j = 1, firstvar = 5, lastvar = 12, 
##D     synthesis = FALSE, graph = FALSE)
##D resperfprob<-magicsort(resperf$prob.ind, method = "median")
##D coltable(resperfprob, level.lower = 0.05, level.upper = 1, 
##D     main.title = "P-value of the F-test (by panelist)")
##D 
##D resperfr2<-magicsort(resperf$r2.ind, method = "median", 
##D     ascending = FALSE)
##D coltable(resperfr2, level.lower = 0.00, level.upper = 0.85, 
##D     main.title = "Adjusted R-square (by panelist)")
## End(Not run)



