library(ALTopt)


### Name: ALTopt-package
### Title: Optimal Experimental Designs for Accelerated Life Testing
### Aliases: ALTopt-package
### Keywords: Accelerated Life Tests, Optimal Design

### ** Examples

## No test: 
# D optimal design of two stress factors with right censoring.
Design.D <- altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
coef = c(0, -4.086, -1.476, 0.01))

design.plot(Design.D$opt.design.rounded, x1, x2)

pv.contour.rc(Design.D$opt.design.rounded, x1, x2, 100, 2, 1,
formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
useCond = c(1.758, 3.159))

FUS.D <- pv.fus.rc(Design.D$opt.design.rounded, 100, 2, 1,
formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))

# U optimal design of two stress factors with right censoring.
Design.U <- altopt.rc("U", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
coef = c(0, -4.086, -1.476, 0.01), useCond = c(1.758, 3.159))

design.plot(Design.U$opt.design.rounded, x1, x2)

pv.contour.rc(Design.U$opt.design.rounded, x1, x2, 100, 2, 1,
formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
useCond = c(1.758, 3.159))

FUS.U <- pv.fus.rc(Design.U$opt.design.rounded, 100, 2, 1,
formula = ~ x1 + x2 + x1:x2, coef = c(0, -4.086, -1.476, 0.01),
useLower = c(1.458, 2.859), useUpper = c(2.058, 3.459))

# Comparing D and U optimal design.
compare.fus(FUS.D, FUS.U)
## End(No test)



