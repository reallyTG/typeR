library(ALTopt)


### Name: pv.contour.rc
### Title: Contour plot of prediction variance for a design with right
###   censoring.
### Aliases: pv.contour.rc

### ** Examples

## Not run: 
##D # Contour plot of prediction variance of U optimal design with right censoring.
##D Design <- altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
##D 
##D pv.contour.rc(Design$opt.design.rounded, x1, x2, 100, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
## End(Not run)



