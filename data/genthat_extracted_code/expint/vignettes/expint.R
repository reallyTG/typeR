### R code from vignette source 'expint.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: expint.Rnw:76-78
###################################################
library(expint)
options(width = 60)


###################################################
### code chunk number 2: expint.Rnw:243-244
###################################################
expint(c(1.275, 10, 12.3), order = 1:3)


###################################################
### code chunk number 3: expint.Rnw:258-261
###################################################
expint_E1(1.275)
expint_E2(10)
expint_En(12.3, order = 3L)


###################################################
### code chunk number 4: expint.Rnw:266-268
###################################################
expint_Ei(5)
-expint_E1(-5)     # same


###################################################
### code chunk number 5: expint.Rnw:377-378
###################################################
op <- options() # remember default number of digits


###################################################
### code chunk number 6: expint.Rnw:380-383
###################################################
options(digits = 20)
gammainc(1.2, 3)
gamma(1.2) * pgamma(3, 1.2, 1, lower = FALSE)


###################################################
### code chunk number 7: expint.Rnw:385-386
###################################################
options(op)     # restore defaults


###################################################
### code chunk number 8: expint.Rnw:444-448
###################################################
x <- c(1.275, 10, 12.3)
n <- 1:10
structure(t(outer(x, n, expint)),
          dimnames = list(n, paste("x =", x)))


###################################################
### code chunk number 9: expint.Rnw:453-457
###################################################
a <- c(-1.5, -1, -0.5, 1)
x <- 1:10
structure(t(outer(a, x, gammainc)),
          dimnames = list(x, paste("a =", a)))


