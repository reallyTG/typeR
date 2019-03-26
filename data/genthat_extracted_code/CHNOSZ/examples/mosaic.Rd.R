library(CHNOSZ)


### Name: mosaic
### Title: Chemical Affinities with Changing Basis Species
### Aliases: mosaic

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)# Fe-minerals and aqueous species in Fe-S-O-H system
# speciate SO4-2, HSO4-, HS-, H2S as a function of Eh and pH
# after Garrels and Christ, 1965 Figure 7.20
pH <- c(0, 14, 200)
Eh <- c(-1, 1, 200)
T <- 25
basis(c("FeO", "SO4-2", "H2O", "H+", "e-"))
basis("SO4-2", -6)
species(c("Fe+2", "Fe+3"), -6)
species(c("pyrrhotite", "pyrite", "hematite", "magnetite"))
# the basis species we'll swap through
bases <- c("SO4-2", "HSO4-", "HS-", "H2S")
# calculate affinities using the predominant basis species
m1 <- mosaic(bases, pH=pH, Eh=Eh, T=T)
# make a diagram and add water stability lines
d <- diagram(m1$A.species, lwd=2)
water.lines(d, col="seagreen", lwd=1.5)
# show lines for Fe(aq) = 10^-4 M
species(c("Fe+2", "Fe+3"), -4)
m2 <- mosaic(bases, pH=pH, Eh=Eh, T=T)
diagram(m2$A.species, add=TRUE, names=NULL)
title(main=paste("Iron oxides and sulfides in water, log(total S) = -6",
  "After Garrels and Christ, 1965", sep="\n"))
# we could overlay the basis species predominance fields
#diagram(m1$A.bases, add=TRUE, col="blue", col.names="blue", lty=3)



