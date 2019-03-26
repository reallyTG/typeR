library(ALTopt)


### Name: pv.fus.ic
### Title: FUS (Fraction of Use Space) plot for interval censoring.
### Aliases: pv.fus.ic

### ** Examples

## Not run: 
##D # FUS plot of I optimal design with interval censoring.
##D Design <- altopt.ic("I", 100, 30, 5, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
##D 
##D pv.fus.ic(Design$opt.design.rounded, 30, 5, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
##D useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
## End(Not run)



