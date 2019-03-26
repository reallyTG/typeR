library(CHNOSZ)


### Name: protein
### Title: Examples of Calculations for Proteins
### Aliases: protein

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## Standard molal entropy of a protein reaction
basis("CHNOS")
# here we provide the reaction coefficients of the 
# proteins (per protein backbone); subcrt() calculates 
# the coefficients of the basis species in the reaction
s <- subcrt(c("CSG_METTL", "CSG_METJA"), c(-1/530, 1/530),
  T=seq(0, 350, length.out=50))
# note: this uses the properties of the nonionized proteins

## logfO2-pH potential diagram
# with a charged basis, we calculate properties of ionized proteins
basis("CHNOS+")
file <- system.file("extdata/protein/DS11.csv", package = "CHNOSZ")
aa <- read.csv(file, as.is=TRUE)
aa <- aa[grep("transferase", aa$protein), ]
ip <- add.protein(aa)
a <- affinity(pH=c(0, 14), O2=c(-64, -61), T=75, iprotein=ip)
diagram(a)
title(main="Sequences for transferase at Bison Pool")

## surface-layer proteins from Methanococcus and others
## as a function of oxygen fugacity, after Dick, 2008, Fig. 5b
# use old properties of [Met] (Dick et al., 2006) to reproduce this example
data(thermo)
mod.obigt("[Met]", G=-35245, H=-59310)
# make our protein list
organisms <- c("METSC", "METJA", "METFE", "HALJP", "METVO",
  "METBU", "ACEKI", "GEOSE", "BACLI", "AERSA")
proteins <- c(rep("CSG", 6), rep("SLAP", 4))
proteins <- paste(proteins, organisms, sep="_")
# load the basis species and proteins
basis("CHNOS+")
species(proteins)
# calculate affinities; we go to lower logfO2 than Dick, 2008
# and find an interesting convergence of stabilities there
a <- affinity(O2=c(-100, -65))
# try normalize=FALSE to make Fig. 5a in the paper
e <- equilibrate(a, normalize=TRUE)
d <- diagram(e, ylim=c(-5, -1), names=organisms, format.names=FALSE)
# add water stability line
abline(v=-83.1, lty=2)
title(main="Surface-layer proteins, after Dick, 2008")
# checking the geometry of the diagram
# most preominant along the x-axis
stopifnot(organisms[unique(which.pmax(e$loga.equil))] ==
  c("METFE", "METJA", "METVO", "HALJP"))
# stability order close to logfO2=-83.1
stopifnot(order(as.data.frame(e$loga.equil)[62,],
  decreasing=TRUE)==c(2, 6, 7, 5, 3, 1, 9, 8, 10, 4))
# reset thermodynamic database
data(thermo)

## relative stabilities of bovine proteins
## as a function of temperature along a glutathione redox buffer
mod.buffer("GSH-GSSG", c("GSH","GSSG"), logact=c(-3, -7))   
basis(c("CO2", "H2O", "NH4+", "SO4-2", "H2", "H+"),
  c(-1, 0, -4, -4, 999, -7)) 
basis("H2", "GSH-GSSG")
basis("CO2", "gas")
prot <- c("CYC", "RNAS1", "BPT1", "ALBU", "INS", "PRIO")
species(prot, "BOVIN")
a <- affinity(T=c(0, 200))
# set line colors according to oxidation state of carbon
ZC <- ZC(species()$ispecies)
col <- ZC.col(ZC)
e <- equilibrate(a, normalize=TRUE)
d <- diagram(e, col=col, lwd=3)
title(main="Bovine proteins, GSH/GSSG redox buffer")



