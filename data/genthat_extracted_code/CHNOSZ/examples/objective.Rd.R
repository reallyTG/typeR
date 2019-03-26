library(CHNOSZ)


### Name: objective
### Title: Objective Functions
### Aliases: objective SD CV shannon DGmix qqr logact spearman pearson RMSD
###   CVRMSD DDGmix DGinf DGtr

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## a made-up system: 4 species, 1 condition
loga1 <- t(-4:-1)
loga2 <- loga1 + 1
stopifnot(qqr(loga1) < 1)
stopifnot(RMSD(loga1, loga1) == 0)
stopifnot(RMSD(loga1, loga2) == 1)
stopifnot(CVRMSD(loga1, loga2) == -0.4) # 1 / mean(-4:-1)
stopifnot(spearman(loga1, loga2) == 1)
stopifnot(spearman(loga1, rev(loga2)) == -1)
# less statistical, more thermodynamical...
stopifnot(all.equal(DGmix(loga1), -0.1234)) # as expected for decimal logarithms
stopifnot(all.equal(DDGmix(loga1, loga2), 0.0004))

## transforming an equilibrium assemblage of n-alkanes
basis(c("CH4", "H2"), c("gas", "gas"))
species(c("methane", "ethane", "propane", "n-butane"), "liq")
# calculate equilibrium assemblages over a range of logaH2
a <- affinity(H2=c(-10, -5, 101), exceed.Ttr=TRUE)
e <- equilibrate(a)
# take a reference equilibrium distribution at logfH2 = -7.5
loga1 <- list2array(e$loga.equil)[51, ]
Astar <- list2array(e$Astar)[51, ]
# equilibrium at any other logfH2 is not equilibrium at logfH2 = -7.5
DGtr.out <- DDGmix.out <- numeric()
for(i in 1:length(a$vals[[1]])) {
  loga2 <- list2array(e$loga.equil)[i, ]
  DGtr.out <- c(DGtr.out, DGtr(t(loga1), loga2, t(Astar)))
  DDGmix.out <- c(DDGmix.out, DDGmix(t(loga1), loga2))
}
# all(DGtr >= 0) is TRUE
stopifnot(all(DGtr.out >= 0))
# all(DDGmix >= 0) is FALSE
stopifnot(!all(DDGmix.out >= 0))
# a plot is also nice
thermo.plot.new(xlim=range(a$vals[[1]]), xlab=axis.label("H2"),
  ylim=range(DDGmix.out, DGtr.out), ylab="energy")
abline(h=0, lty=2)
abline(v=-7.5, lty=2)
text(-7.6, 2, "reference condition", srt=90)
lines(a$vals[[1]], DDGmix.out)
lines(a$vals[[1]], DGtr.out)
text(-6, 5.5, expr.property("DDGmix/2.303RT"))
text(-6, 2.3, expr.property("DGtr/2.303RT"))
title(main=paste("Transformation between metastable equilibrium\n",
  "assemblages of n-alkanes"))
# take-home message: use DGtr to measure distance from equilibrium in 
# open-system transformations (constant T, P, chemical potentials of basis species)



