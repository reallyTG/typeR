library(SensoMineR)


### Name: paneliperf
### Title: Panelists' performance according to their capabilities to
###   dicriminate between products
### Aliases: paneliperf
### Keywords: models

### ** Examples

## Not run: 
##D data(chocolates)
##D res<-paneliperf(sensochoc, formul = "~Product+Panelist+Session+
##D   Product:Panelist+Product:Session+Panelist:Session",
##D   formul.j = "~Product", col.j = 1, firstvar = 5, synthesis = TRUE)
##D resprob<-magicsort(res$prob.ind, method = "median")
##D coltable(resprob, level.lower = 0.05, level.upper = 1,
##D     main.title = "P-value of the F-test (by panelist)")
##D hist(resprob,main="Histogram of the P-values",xlab="P-values")
##D 
##D resr2<-magicsort(res$r2.ind, method = "median", ascending = FALSE)
##D coltable(resr2, level.lower = 0.00, level.upper = 0.85,
##D     main.title = "Adjusted R-square (by panelist)")
##D 
##D resagree<-magicsort(res$agree, sort.mat = res$r2.ind, method = "median")
##D coltable(resagree, level.lower = 0.00, level.upper = 0.85,
##D     main.title = "Agreement between panelists")
##D hist(resagree,main="Histogram of the agreement between panelist and panel",
##D     xlab="Correlation coefficient between the product effect for 
##D     panelist and panel")
##D 
##D coltable(magicsort(res$p.value, sort.mat = res$p.value[,1], bycol = FALSE,
##D     method = "median"),
##D     main.title = "Panel performance (sorted by product P-value)")
## End(Not run)



