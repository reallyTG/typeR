library(frair)


### Name: frair_boot_methods
### Title: frair methods
### Aliases: frair_boot_methods print.frboot confint.frboot plot.frboot
###   lines.frboot drawpoly.frboot print.frconf

### ** Examples

# This example is not run to save CRAN build server time...
## Not run: 
##D data(gammarus)
##D 
##D # Holling's is the wrong fit for these data based on the experimental design
##D # But it runs more quickly, so is a useful demonstration
##D outhol <- frair_fit(eaten~density, data=gammarus, response='hollingsII', 
##D         start=list(a = 1, h = 0.08), fixed=list(T=40/24))
##D outholb <- frair_boot(outhol)
##D 
##D confint(outholb)
##D 
##D # Illustrate bootlines
##D plot(outholb, xlim=c(0,30), type='n', main='All bootstrapped lines')
##D lines(outholb, all_lines=TRUE)
##D points(outholb, pch=20, col=rgb(0,0,0,0.2))
##D 
##D # Illustrate bootpolys
##D plot(outholb, xlim=c(0,30), type='n', main='Empirical 95 percent CI')
##D drawpoly(outholb, col=rgb(0,0.5,0))
##D points(outholb, pch=20, col=rgb(0,0,0,0.2))
## End(Not run)



