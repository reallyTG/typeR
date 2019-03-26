library(CHNOSZ)


### Name: add.obigt
### Title: Functions to Work with the Thermodynamic Database
### Aliases: add.obigt mod.obigt today

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## modify an existing species (example only)
ialanine <- mod.obigt("alanine", state="cr", G=0, H=0, S=0)
# we have made the values of G, H, and S inconsistent
# with the elemental composition of alanine, so the following 
# now produces a message about that
info(ialanine)
## add a species
iCl2O <- mod.obigt("Cl2O", G=20970)
info(iCl2O)
# add a species with a name that is different from the formula
mod.obigt("buckminsterfullerene", formula="C60", state="cr", date=today())
# retrieve the species data (thermodynamic properties in this toy example are NA)
info(info("C60"))
# reset database
data(OBIGT)

# using add.obigt():
# compare stepwise stability constants of cadmium chloride complexes
# using data from Sverjensky et al., 1997 and Bazarkina et al., 2010
Cdspecies <- c("Cd+2", "CdCl+", "CdCl2", "CdCl3-", "CdCl4-2")
P <- c(1, seq(25, 1000, 25))
SSH97 <- lapply(1:4, function(i) {
  subcrt(c(Cdspecies[i], "Cl-", Cdspecies[i+1]),
    c(-1, -1, 1), T=25, P=P)$out$logK
})
file <- system.file("extdata/thermo/BZA10.csv", package="CHNOSZ")
add.obigt(file)
BZA10 <- lapply(1:4, function(i) {
  subcrt(c(Cdspecies[i], "Cl-", Cdspecies[i+1]),
    c(-1, -1, 1), T=25, P=P)$out$logK
})
# reset default database
data(OBIGT)
matplot(P, do.call(cbind, SSH97), type="l")
matplot(P, do.call(cbind, BZA10), type="l", add=TRUE, lwd=2)
legend("topleft", legend=c("", "", "Sverjensky et al., 1997",
  "Bazarkina et al., 2010"), lwd=c(0, 0, 1, 2), bty="n")
# make reaction labels
y <- c(1.8, 0.2, -0.5, -1)
invisible(lapply(1:4, function(i) {
  text(800, y[i], describe.reaction(subcrt(c(Cdspecies[i], "Cl-",
    Cdspecies[i+1]), c(-1, -1, 1), T=25, P=1)$reaction))
}))



