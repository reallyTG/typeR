library(ALTopt)


### Name: compare.vdus
### Title: Comparing designs using VDUS
### Aliases: compare.vdus

### ** Examples

## Not run: 
##D # Generating D optimal design and VDUS plot.
##D Dopt <- altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01))
##D 
##D VDUS.D <- pv.vdus.rc(Dopt$opt.design.rounded, 100, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
##D useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
##D 
##D # Generating U optimal design and VDUS plot.
##D Uopt <- altopt.rc("U", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))
##D 
##D VDUS.U <- pv.vdus.rc(Uopt$opt.design.rounded, 100, 2, 1,
##D formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
##D useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))
##D 
##D # Comparing D and U optimal designs.
##D compare.vdus(VDUS.D, VDUS.U)
## End(Not run)



