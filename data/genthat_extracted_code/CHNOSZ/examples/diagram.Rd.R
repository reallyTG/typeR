library(CHNOSZ)


### Name: diagram
### Title: Chemical Activity Diagrams
### Aliases: diagram strip find.tp

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## calculate the equilibrium logarithm of activity of a 
## basis species in different reactions
basis("CHNOS")
species(c("ethanol", "lactic acid", "deoxyribose", "ribose"))
a <- affinity(T=c(0, 150))
diagram(a, what="O2", legend.x="topleft", col=rev(rainbow(4)), lwd=2)
title(main="Equilibrium logfO2 for 1e-3 mol/kg of CO2 and ... ")

### 1-D diagrams: logarithms of activities

## Degrees of formation of ionized forms of glycine
## After Fig. 1 of Aksu and Doyle, 2001 
basis("CHNOS+")
species(ispecies <- info(c("glycinium", "glycine", "glycinate")))
a <- affinity(pH=c(0, 14))
e <- equilibrate(a)
diagram(e, alpha=TRUE, lwd=1)
title(main=paste("Degrees of formation of aqueous glycine species\n",
  "after Aksu and Doyle, 2001"))

## Degrees of formation of ATP species as a function of 
## temperature, after LaRowe and Helgeson, 2007, Fig. 10b
# to make a similar diagram, activity of Mg+2 here is set to
# 10^-4, which is different from LH07, who used 10^-3 total molality
basis(c("CO2", "NH3", "H2O", "H3PO4", "O2", "H+", "Mg+2"),
  c(999, 999, 999, 999, 999, -5, -4))
species(c("HATP-3", "H2ATP-2", "MgATP-2", "MgHATP-"))
a <- affinity(T=c(0, 120, 25))
e <- equilibrate(a)
diagram(e, alpha=TRUE)  
title(main=paste("Degrees of formation of ATP species,\n",
  "pH=5, log(aMg+2)=-3. After LaRowe and Helgeson, 2007"),
  cex.main=0.9)

### 2-D diagrams: predominance diagrams
### these use the maximum affinity method

## Fe-S-O at 200 deg C, after Helgeson, 1970
basis(c("Fe", "O2", "S2"))
species(c("iron", "ferrous-oxide", "magnetite",
  "hematite", "pyrite", "pyrrhotite"))
# the calculations include the phase transitions of
# pyrrhotite; no additional step is needed
a <- affinity(S2=c(-50, 0), O2=c(-90, -10), T=200)
diagram(a, fill="heat")
title(main=paste("Fe-S-O, 200 degrees C, 1 bar",
  "After Helgeson, 1970", sep="\n"))

## pe-pH diagram for hydrated iron sulfides,
## goethite and pyrite, after Majzlan et al., 2006
basis(c("Fe+2", "SO4-2", "H2O", "H+", "e-"), 
  c(0, log10(3), log10(0.75), 999, 999))
species(c("rhomboclase", "ferricopiapite", "hydronium jarosite",
  "goethite", "melanterite", "pyrite"))
a <- affinity(pH=c(-1, 4, 256), pe=c(-5, 23, 256))
d <- diagram(a, main="Fe-S-O-H, after Majzlan et al., 2006")
# the first four species show up in order near pe=15
stopifnot(all.equal(unique(d$predominant[, 183]), 1:4))
water.lines(d, lwd=2)
text(3, 22, describe.basis(thermo$basis[2:3,], digits=2, oneline=TRUE))
text(3, 21, describe.property(c("T", "P"), c(25, 1), oneline=TRUE))

## Temperature-Pressure: kayanite-sillimanite-andalusite
# cf. Fig. 49 of Helgeson et al., 1978
# this is a system of one component (Al2SiO5), however:
# - number of basis species must be the same as of elements
# - avoid using H2O or other aqueous species because of
#     T/P limits of the water() calculations;
# - because it triggers calculations for phase transitions,
#    (takes more time), don't use quartz unless it's needed
basis(c("corundum", "chalcedony", "oxygen"))
species(c("kyanite", "sillimanite", "andalusite"))
# database has transition temperatures of kyanite and andalusite
# at 1 bar only, so we permit calculation at higher temperatures
a <- affinity(T=c(200, 900, 99), P=c(0, 9000, 101), exceed.Ttr=TRUE)
d <- diagram(a, fill=NULL)
bexpr <- sapply(c("Al2O3", "SiO2", "H2O"), expr.species, simplify=FALSE)
btext <- substitute(Al2O3 - SiO2 - H2O, unlist(bexpr))
mtitle(c(as.expression(btext), "after Helgeson et al., 1978"))
# find the approximate position of the triple point
tp <- find.tp(d$predominant)
Ttp <- a$vals[[1]][tp[1, 2]]
Ptp <- rev(a$vals[[2]])[tp[1, 1]]
points(Ttp, Ptp, pch=10, cex=5)
# some testing of the overall geometry
stopifnot(species()$name[d$predominant[1, 1]]=="andalusite")
stopifnot(species()$name[d$predominant[1, 101]]=="kyanite")
stopifnot(species()$name[d$predominant[99, 101]]=="sillimanite")



