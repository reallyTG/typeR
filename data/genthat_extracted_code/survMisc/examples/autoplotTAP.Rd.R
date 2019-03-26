library(survMisc)


### Name: autoplotTableAndPlot
### Title: Arrange a survival plot with corresponding table and legend.
### Aliases: autoplotTableAndPlot autoplot.tableAndPlot
### Keywords: graphics

### ** Examples

## Not run: 
##D data("kidney", package="KMsurv")
##D autoplot(survfit(Surv(time, delta) ~ type, data=kidney), type="fill")
##D autoplot(ten(survfit(Surv(time, delta) ~ type, data=kidney)), type="fill")
##D data("bmt", package="KMsurv")
##D s2 <- survfit(Surv(time=t2, event=d3) ~ group, data=bmt)
##D autoplot(s2)
## End(Not run)



