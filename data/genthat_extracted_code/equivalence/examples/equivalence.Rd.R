library(equivalence)


### Name: equivalence
### Title: Equivalence Tests
### Aliases: equivalence
### Keywords: htest

### ** Examples


data(ufc)

### Tost

tost(ufc$Height.m.p, ufc$Height.m, epsilon = 1)

### equivalence plot

ufc.ht <- ufc[!is.na(ufc$Height),]
equivalence.xyplot(ufc.ht$Height.m ~ ufc.ht$Height.m.p,
                   alpha=0.05, b0.ii=0.1, b1.ii=0.2,
                   xlab="Predicted height (m)",
                   ylab="Measured height (m)")




