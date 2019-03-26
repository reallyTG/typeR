library(ALTopt)


### Name: pv.contour.ic
### Title: Contour plot of prediction variance for a design with interval
###   censoring.
### Aliases: pv.contour.ic

### ** Examples

## Not run: 
##D # Contour plot of prediction variance of U optimal design with interval censoring.
##D Design <- altopt.ic("D", 100, 30, 5, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
##D 
##D pv.contour.ic(Design$opt.design.rounded, x1, x2, 30, 5, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
## End(Not run)



