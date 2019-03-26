library(nsRFA)


### Name: HW.original
### Title: Original Hosking and Wallis Fortran routine
### Aliases: HW.original print.HWorig plot.HWorig LMR PEL SAMLMR SAMLMU
###   SAMPWM REGLMR REGTST
### Keywords: htest

### ** Examples

data(hydroSIMN)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
split(x,cod)

HW.original(x,cod)

fac <- factor(annualflows["cod"][,],levels=c(34:38))
x2 <- annualflows[!is.na(fac),"dato"]
cod2 <- annualflows[!is.na(fac),"cod"]

HW.original(x2,cod2)

plot(HW.original(x2,cod2))



