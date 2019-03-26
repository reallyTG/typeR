library(SensoMineR)


### Name: panelperf
### Title: Panel's performance according to its capabilities to dicriminate
###   between products
### Aliases: panelperf
### Keywords: models

### ** Examples

data(chocolates)
res=panelperf(sensochoc, firstvar = 5, formul = "~Product+Panelist+
    Session+Product:Panelist+Session:Product+Panelist:Session")
## Sort results by product p.values.
coltable(magicsort(res$p.value, sort.mat = res$p.value[,1], bycol = FALSE,
    method = "median"), main.title = "Panel performance (sorted by product P-value)")



