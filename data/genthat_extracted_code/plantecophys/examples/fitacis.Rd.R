library(plantecophys)


### Name: fitacis
### Title: Fit multiple A-Ci curves at once
### Aliases: fitacis plot.acifits

### ** Examples


## Not run: 
##D # Fit many curves (using an example dataset)
##D # The bilinear method is much faster, but compare using 'default'!
##D fits <- fitacis(manyacidat, "Curve", fitmethod="bilinear")
##D with(coef(fits), plot(Vcmax, Jmax))
##D 
##D # The resulting object is a list, with each component an object as returned by fitaci
##D # So, we can extract one curve:
##D fits[[1]]
##D plot(fits[[1]])
##D 
##D # Plot all curves in separate figures with plot(fits)
##D # Or, in one plot:
##D plot(fits, how="oneplot")
##D 
##D # Note that parameters can be passed to plot.acifit. For example,
##D plot(fits, how="oneplot", what="data", col="blue")
##D plot(fits, how="oneplot", add=TRUE, what="model", lwd=c(1,1))
##D 
##D # Other elements can be summarized with sapply. For example, look at the RMSE:
##D rmses <- sapply(fits, "[[", "RMSE")
##D plot(rmses, type='h', ylab="RMSE", xlab="Curve nr")
##D 
##D # And plot the worst-fitting curve:
##D plot(fits[[which.max(rmses)]])
##D 
##D # It is very straightforward to summarize the coefficients by a factor variable
##D # that was contained in the original data. In manyacidat, there is a factor variable
##D # 'treatment'.
##D # We first have to refit the curves, using the 'id' argument:
##D fits <- fitacis(manyacidat, "Curve", fitmethod="bilinear", id="treatment")
##D 
##D # And now use this to plot Vcmax by treatment.
##D boxplot(Vcmax ~ treatment, data=coef(fits), ylim=c(0,130))
## End(Not run)




