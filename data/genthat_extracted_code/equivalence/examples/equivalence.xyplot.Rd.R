library(equivalence)


### Name: equivalence.xyplot
### Title: Constructs graphical regression-based tests of equivalence
###   inside a lattice coplot
### Aliases: equivalence.xyplot
### Keywords: models htest

### ** Examples


data(pref.4PG)
equivalence.xyplot(pref.4PG$stemvolinc ~ pref.4PG$volinc4PG,
                   alpha=0.05, b0.ii=0.25, b1.ii=0.25, add.smooth=TRUE, 
                   xlab=expression(paste("4PG decadal volume growth (", m^3,
                       ha^-1, decade^-1, ")", sep="")), 
                   ylab=expression(paste("Measured decadal volume growth (",
                       m^3, ha^-1, decade^-1, ")", sep="")))

data(pref.LAI)
equivalence.xyplot(pref.LAI$lai.pa ~ pref.LAI$lai.bl,
                   alpha=0.05, b0.ii=0.25, b1.ii=0.25,
                   xlab=expression(paste("LAI Beer-Lambert (", m^2, m^-2, ")",
                       sep="")), 
                   ylab=expression(paste("LAI Ceptometer (", m^2, m^-2, ")",
                       sep=""))) 


data(ufc)
ufc.ht <- ufc[!is.na(ufc$Height),]
equivalence.xyplot(ufc.ht$Height.m ~ ufc.ht$Height.m.p,
                   alpha=0.05, b0.ii=0.1, b1.ii=0.2,
                   xlab="Predicted height (m)",
                   ylab="Measured height (m)")

equivalence.xyplot(ufc.ht$Height.m ~ ufc.ht$Height.m.p | ufc.ht$Species,
                   alpha=0.05, b0.ii=0.1, b1.ii=0.2,
                   xlab="Predicted height (m)",
                   ylab="Measured height (m)",
                   subset=ufc.ht$Species %in%
                        levels(ufc.ht$Species)[table(ufc.ht$Species)>5])



