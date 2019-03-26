library(CHNOSZ)


### Name: berman
### Title: Thermodynamic Properties of Minerals
### Aliases: berman

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
# other than the formula, the parameters aren't stored in
# thermo$obigt, so this shows NAs
info(info("quartz", "cr_Berman"))
# properties of alpha-quartz (aQz) at 298.15 K and 1 bar
berman("quartz")
# Gibbs energies of aQz and coesite at higher T and P
T <- seq(200, 1300, 100)
P <- seq(22870, 31900, length.out=length(T))
G_aQz <- berman("quartz", T=T, P=P)$G
G_Cs <- berman("coesite", T=T, P=P)$G
# that is close to the univariant curve (Ber88 Fig. 4),
# so the difference in G is close to 0
DGrxn <- G_Cs - G_aQz
stopifnot(all(abs(DGrxn) < 100))

# calculate the properties of a "reaction" between
# the Helgeson and Berman versions of quartz
T <- 1000
P <- c(10000, 20000)
subcrt(rep("quartz", 2), c("cr", "cr_Berman"), c(-1, 1), T=T, P=P)

# make a P-T diagram for SiO2 minerals (Ber88 Fig. 4)
basis(c("SiO2", "O2"), c("cr_Berman", "gas"))
species(c("quartz", "quartz,beta", "coesite"), "cr_Berman")
a <- affinity(T=c(200, 1700, 200), P=c(0, 50000, 200))
diagram(a)

## a longer example, comparing diagrams made using the
## Berman and Helgeson datasets, after Sverjensky et al., 1991
res <- 200
# using the Helgeson data
# set up basis species
basis(c("K+", "Al+3", "quartz", "H2O", "O2", "H+"))
# use pH = 0 so that aK+ = aK+/aH+
basis("pH", 0)
# load the species
species(c("K-feldspar", "muscovite", "kaolinite",
          "pyrophyllite", "andalusite"), "cr")
# calculate affinities in aK+ - temperature space
a <- affinity(`K+`=c(0, 5, res), T=c(200, 650, res), P=1000)
# note that we go just past the quartz transition,
# but it has no effect on the diagram
diagram(a, xlab=ratlab("K+"))
# now using the Berman data
basis("SiO2", "cr_Berman")
# it might be good to check that we have Berman's quartz
# and not coesite or some other SiO2 phase
info(basis()$ispecies[3])
# remove the Helgeson minerals
species(delete=TRUE)
# load the Berman minerals
species(c("K-feldspar", "muscovite", "kaolinite",
          "pyrophyllite", "andalusite"), "cr_Berman")
a <- affinity(`K+`=c(0, 5, res), T=c(200, 650, res), P=1000)
diagram(a, add=TRUE, names="", col="blue", lwd=2)
legend("topleft", lty=c(1, 1, NA), lwd=c(1, 2, 0), col=c("black", "blue", ""),
       legend=c("Helgeson et al., 1978 (unadjusted)",
       "Berman, 1988", "    (adjusted by Sverjensky et al., 1991)"), bty="n")
title(main="Comparison of Helgeson and Berman datasets at 1000 bar")



