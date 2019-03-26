library(HH)


### Name: residual.plots.lattice
### Title: Construct four sets of regression plots: Y against X, residuals
###   against X, partial residuals against X, partial residuals against
###   each X adjusted for all the other X columns.
### Aliases: residual.plots.lattice
### Keywords: dplot

### ** Examples

     data(longley)
     longley.lm <- lm( Employed ~ . , data=longley, x=TRUE, y=TRUE)
     residual.plots.lattice(longley.lm)

     ## Not run: 
##D             pdf("longley-resid.pdf", height=9, width=14)
##D                  print(residual.plots.lattice(longley.lm, pch=19),
##D                             A4.left=.0125, panel.width=list(5,"cm"))
##D                  dev.off()
##D                
## End(Not run)
     


