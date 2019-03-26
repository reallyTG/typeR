library(RCPmod)


### Name: plot.registab
### Title: Diagnostic plotting to see if RCP groups are stable
### Aliases: plot.registab
### Keywords: misc

### ** Examples

## Not run: 
##D #not run as R CMD check complains about the time taken.
##D #This code will take a little while to run (about 3.5minutes on my computer)
##D system.time({
##D example( regimix);
##D my.registab <- stability.regimix( fm, oosSizeRange=seq( from=1,to=fm$n%/%5,length=5),
##D       times=fm$n, mc.cores=2, doPlot=FALSE);
##D plot( my.registab, minWidth=1, ncuts=15);
##D })
## End(Not run)



