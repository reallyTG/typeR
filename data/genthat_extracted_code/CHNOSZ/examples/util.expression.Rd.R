library(CHNOSZ)


### Name: util.expression
### Title: Functions to Express Chemical Formulas and Properties
### Aliases: util.expression expr.species expr.property expr.units
###   axis.label describe.basis describe.property describe.reaction syslab
###   ratlab

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## show descriptions of species and properties on a plot
plot(0, 0, xlim=c(1,5), ylim=c(1,5), xlab="function", ylab="example")
text0 <- function(...) text(..., adj=0)
# species
text0(1, 1, expr.species("CO2"))
text0(1, 2, expr.species("CO2", state="aq"))
text0(1, 3, expr.species("CO2", state="aq", log="aq"))
text0(1, 4, expr.species("CO2", log="aq"))
text0(1, 5, expr.species("CO2", log="aq", value=-3))
# properties
text0(2, 1, expr.property("A"))
text0(2, 2, expr.property("DV"))
text0(2, 3, expr.property("DG0f"))
text0(2, 4, expr.property("DCp0,r"))
text0(2, 5, expr.property("T"))
# units
text0(3, 1, expr.units("A", prefix="k"))
text0(3, 2, expr.units("DV"))
text0(3, 3, expr.units("DG0f", prefix="k"))
text0(3, 4, expr.units("DCp0,r"))
text0(3, 5, expr.units("T"))
# axis.label
text0(4, 1, axis.label("DG0f"))
text0(4, 2, axis.label("T"))
text0(4, 3, axis.label("pH"))
text0(4, 4, axis.label("Eh"))
text0(4, 5, axis.label("IS"))
# describe.basis
basis("CHNOS+")
dbasis <- describe.basis(oneline=TRUE, digits=0)
property <- c("P", "T", "Eh", "pH", "IS")
value <- c(1, 42.42, -1, 7, 0.1)
dprop <- describe.property(property, value, oneline=TRUE)
text(3, 1.5, dbasis)
text(3, 2.5, dprop)
dbasis <- describe.basis(ibasis=c(1, 5))
dprop <- describe.property(property[1:2], value[1:2])
legend(2.4, 3.9, legend=c(dbasis, dprop), bty="n")
# describe.reaction
# reaction is automatically balanced since basis species are defined
reaction <- subcrt("glucose", -1)$reaction
text(3, 4.25, describe.reaction(reaction))
text(3, 4.5, describe.reaction(reaction, states="all"))
text(3, 4.75, describe.reaction(reaction, iname=1:4))
title(main="Plot labels for chemical species and thermodynamic properties")



