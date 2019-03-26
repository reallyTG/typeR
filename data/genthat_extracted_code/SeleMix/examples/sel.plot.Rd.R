library(SeleMix)


### Name: sel.plot
### Title: Scatterplot with information about outliers and influential
###   errors
### Aliases: sel.plot

### ** Examples


    data(ex2.data)
    par.joint <- ml.est(y=ex2.data)
    sel <- sel.edit(y=ex2.data, ypred=par.joint$ypred)	
    sel.plot(ex2.data,outl=par.joint$outlier, sel=sel[,"sel"], title="EXAMPLE 2")
  ## Not run: 
##D    
##D     sel.plot(ex2.data,outl=par.joint$outlier, sel=sel[,"sel"], title="EXAMPLE 2", n.identify=3)
##D     
## End(Not run)
    



