library(CHNOSZ)


### Name: subcrt
### Title: Properties of Species and Reactions
### Aliases: subcrt

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## properties of species
subcrt("water")
# calculating at different temperatures
subcrt("water", T=seq(0, 100, 10))
# calculating at even increments  	
subcrt("water", T=seq(500, 1000, length.out=10),
  P=seq(5000, 10000, length.out=10))
# calculating on a temperature-pressure grid
subcrt("water", T=c(500, 1000), P=c(5000, 10000), grid="P")
# to calculate only selected properties
subcrt("water", property=c("G", "E"))	
# the properties of multiple species
subcrt(c("glucose", "ethanol", "CO2"))

## properties of reactions
subcrt(c("H2O", "H+", "K-feldspar", "kaolinite", "K+", "SiO2"),
  c(-1, -2, -2, 1, 2, 4))
subcrt(c("glucose", "ethanol", "CO2"), c(-1, 2, 2))
# to specify the states
subcrt(c("glucose", "ethanol", "CO2"), c(-1, 2, 2), c("aq", "aq", "gas")) 

## auto balancing reactions
# the basis species must first be defined
basis(c("CO2", "H2O", "NH3", "H2S", "O2"))
subcrt(c("glucose", "ethanol"), c(-1, 3))
# a bug in CHNOSZ <0.9 caused the following
# to initiate an infinite loop
basis(c("H2O", "H2S", "O2", "H+"))
subcrt(c("HS-", "SO4-2"), c(-1, 1))
# because O2,aq is in the basis, this is a non-reaction
# (O2,aq to O2,aq)
subcrt("O2", 1, "aq")
# but this one auto-balances into a reaction
# (O2,aq to O2,gas)
subcrt("O2", 1, "gas")
# properties of a species and a formation 
# reaction for that species
subcrt("C2H5OH")    # species
basis("CHNOS")
subcrt("C2H5OH", 1) # reaction

## mineral polymorphs
# properties of the stable polymorph
subcrt("pyrrhotite")
# properties of just the high-T phase
subcrt(c("pyrrhotite"), state="cr2")
# polymorphic transitions in a reaction
subcrt(c("pyrite", "pyrrhotite", "H2O", "H2S", "O2"), c(-1, 1, -1, 1, 0.5))

## these produce messages about problems with the calculation
# above the T, P limits for the H2O equations of state
subcrt("alanine", T=c(2250, 2251), P=c(30000, 30001), grid="T")
# Psat is not defined above the critical point
## Not run: 
##D ## (also gives a warning)
##D subcrt("alanine", T=seq(0, 5000, by=1000))
## End(Not run)

## minerals with phase transitions
# compare calculated values of heat capacity of iron with
# values from Robie and Hemingway, 1995
T.units("K")
E.units("J")
# we set pressure here otherwise subcrt uses Psat (saturation 
# vapor pressure of H2O above 100 degrees C) which can not be 
# calculated above the critical point of H2O (~647 K)
s <- subcrt("Fe", T=seq(300, 1800, 20), P=1)
plot(s$out[[1]]$T, s$out[[1]]$Cp, type="l",
  xlab=axis.label("T"), ylab=axis.label("Cp"))
# add points from RH95
RH95 <- read.csv(system.file("extdata/cpetc/RH95.csv", package="CHNOSZ"))
points(RH95[,1], RH95[,2])
title(main=paste("Heat capacity of Fe(cr)\n",
  "(points - Robie and Hemingway, 1995)"))
# reset the units to default values
T.units("C")
E.units("cal")

## Skarn example after Johnson et al., 1992
P <- seq(500, 5000, 500)
# this is like the temperature specification used 
# in the example by Johnson et al., 1992
# T <- seq(0, 1000, 100)
# we use this one to avoid warnings at 0 deg C, 5000 bar
T <- c(2, seq(100, 1000, 100))
s <- subcrt(c("andradite", "carbon dioxide", "H2S", "Cu+", "quartz", 
  "calcite", "chalcopyrite", "H+", "H2O"), 
  coeff=c(-1, -3, -4, -2, 3, 3, 2, 2, 3),
  state=c("cr", "g", "aq", "aq", "cr", "cr", "cr", "aq", "liq"),
  P=P, T=T, grid="P")
# The results are not identical to SUPCRT92, as CHNOSZ has updated
# parameters for species e.g. Cu+ from Shock et al., 1997.
# Check the calculated phase transitions for chalcopyrite
stopifnot(all.equal(s$polymorphs$chalcopyrite[1:11], 
  c(1, 1, 1, 1, 1, 1, 2, 3, 3, 3, 3)))

## Standard Gibbs energy of reactions with HCN and 
## formaldehyde, after Schulte and Shock, 1995 Fig. 1
rxn1 <- subcrt(c("formaldehyde","HCN","H2O","glycolic acid","NH3"),
  c(-1,-1,-2,1,1),P=300)
rxn2 <- subcrt(c("formaldehyde","HCN","H2O","glycine"),
  c(-1,-1,-1,1),P=300)
plot(x=rxn1$out$T,rxn1$out$G/1000,type="l",ylim=c(-40,-10),
  xlab=axis.label("T"),ylab=axis.label("DG0r","k"))
lines(rxn1$out$T,rxn2$out$G/1000)
# write the reactions on the plot
text(150, -14, describe.reaction(rxn1$reaction, iname=c(1,2,4)))
text(200, -35, describe.reaction(rxn2$reaction, iname=c(1,2)))
title(main=paste("Standard Gibbs energy of reactions",
  "after Schulte and Shock, 1995",sep="\n"))

## Calculation of chemical affinities
# after LaRowe and Helgeson, 2007, Fig. 3 (a): reduction of nicotinamide 
# adenine dinucleotide (NAD) coupled to oxidation of glucose
# list the available NAD species
info("NAD ")
T <- seq(0, 120, 10)
# oxidation of glucose (C6H12O6)
basis(c("glucose", "H2O", "NH3", "CO2", "H+"), c(-3, 0, 999, -3, -7))
s <- subcrt(c("NAD(ox)-", "NAD(red)-2"), c(-12, 12), logact=c(0, 0), T=T)
# LH07's diagrams are shown per mole of electron (24 e- per 12 NAD)
A <- s$out$A/24/1000
plot(x=T, y=A, xlim=range(T), ylim=c(1.4, 5.4),
  xlab=axis.label("T"), ylab=axis.label("A", prefix="k"), type="l")
text("NAD(ox)-/NAD(red)-2 = 1", x=53, y=median(A), srt=21)
# different activity ratio
s <- subcrt(c("NAD(ox)-","NAD(red)-2"), c(-12, 12), logact=c(1, 0), T=T)
A <- s$out$A/24/1000
lines(x=T, y=A)
text("NAD(ox)-/NAD(red)-2 = 10", x=55, y=median(A), srt=24)
# different activity ratio
s <- subcrt(c("NAD(ox)-","NAD(red)-2"), c(-12, 12), logact=c(0, 1), T=T)
A <- s$out$A/24/1000
lines(x=T, y=A)
text("NAD(ox)-/NAD(red)-2 = 0.1", x=52, y=median(A), srt=18)
# print the reaction and chemical conditions on the plot
text(0, 5.3, describe.reaction(s$reaction, iname=c(1, 2)), adj=0)
text(0, 5.1, describe.basis(oneline=TRUE, ibasis=c(1, 2, 4, 5)), adj=0)
# label the plot
title(main=paste("Reduction of NAD coupled to oxidation of glucose",
 "after LaRowe and Helgeson, 2007", sep="\n"))

## Subzero (degrees C) calculations
# uncomment the following to try IAPWS95 instead of SUPCRT92
#water("IAPWS95")
# the limit for H2O92D.f (from SUPCRT92) is currently -20 deg C
# but we go to -30 knowing properties will become NA
sb <- subcrt(c("H2O", "Na+"), T=seq(-30, 10), P=1)$out
# start plot with extra room on right
par(mar=c(5, 4, 4, 4))
# plot G
plot(sb$water$T, sb$water$G, ylim=c(-63000, -56000), xlab=axis.label("T"),
  ylab=axis.label("DG0"))
points(sb$`Na+`$T, sb$`Na+`$G, pch=2)
# add Cp
# change y-axis
par("usr"=c(par("usr")[1:2], -100, 25))
axis(4)
mtext(axis.label("Cp0"), side=4, line=3)
points(sb$water$T, sb$water$Cp, pch=16)
points(sb$`Na+`$T, sb$`Na+`$Cp, pch=17)
legend("topleft", pch=c(16, 1, 17, 2), legend=c("H2O Cp", "H2O G", "Na+ Cp", "Na+ G"))
H2O <- expr.species("H2O")
Na <- expr.species("Na+")
degC <- expr.units("T")
title(main=substitute(H2O~and~Na~to~-20~degC, list(H2O=H2O, Na=Na, degC=degC)))

## Calculations using a variable-pressure standard state
thermo$opt$varP <<- TRUE
# Calculate the boiling point of n-octane at 2 and 20 bar
# We need exceed.Ttr=TRUE because the liquid is metastable
# at high temperatures (also, the gas is metastable at low
# temperatures, but that doesn't produce NA in the output)
sout2 <- subcrt(rep("n-octane", 2), c("liq", "gas"),
  c(-1, 1), T=seq(-50, 300, 0.1), P=2, exceed.Ttr=TRUE)$out
sout20 <- subcrt(rep("n-octane", 2), c("liq", "gas"),
  c(-1, 1), T=seq(-50, 300, 0.1), P=20, exceed.Ttr=TRUE)$out
# find T with the Gibbs energy of reaction that is closest to zero
Tvap2 <- sout2$T[which.min(abs(sout2$G))]
Tvap20 <- sout20$T[which.min(abs(sout20$G))]
# the boiling point increases with pressure
stopifnot(Tvap20 > Tvap2)
# more precisely, the calculated boiling points should be near the
# empirical values (digitized from Fig. 1 of Helgeson et al., 1998)
Tvap_2bar <- 156
Tvap_20bar <- 276
stopifnot(abs(Tvap2 - Tvap_2bar) < 6)
stopifnot(abs(Tvap20 - Tvap_20bar) < 25)
# those comparisons would fail if varP were FALSE (the default)
thermo$opt$varP <<- FALSE



