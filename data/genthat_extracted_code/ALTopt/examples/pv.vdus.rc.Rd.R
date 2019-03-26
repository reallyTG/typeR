library(ALTopt)


### Name: pv.vdus.rc
### Title: VDUS (Variance Dispersion of Use Space) plot for right
###   censoring.
### Aliases: pv.vdus.rc

### ** Examples

## Not run: 
##D # VDUS plot of I optimal design with right censoring.
##D Design <- altopt.rc("I", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
##D 
##D pv.vdus.rc(Design$opt.design.rounded, 100, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
##D useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
## End(Not run)



