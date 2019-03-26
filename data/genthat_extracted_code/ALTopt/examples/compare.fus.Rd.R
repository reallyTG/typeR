library(ALTopt)


### Name: compare.fus
### Title: Comparing designs using FUS
### Aliases: compare.fus

### ** Examples

## Not run: 
##D # Generating D optimal design and FUS plot.
##D Dopt <- altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01))
##D 
##D FUS.D <- pv.fus.rc(Dopt$opt.design.rounded, 100, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
##D useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
##D 
##D # Generating U optimal design and FUS plot.
##D Uopt <- altopt.rc("U", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
##D 
##D FUS.U <- pv.fus.rc(Uopt$opt.design.rounded, 100, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
##D useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
##D 
##D # Comparing D and U optimal designs.
##D compare.fus(FUS.D, FUS.U)
## End(Not run)



