library(CHNOSZ)


### Name: ionize.aa
### Title: Properties of Ionization of Proteins
### Aliases: ionize.aa

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## Charge of LYSC_CHICK as a function of pH and T
# After Fig. 10 of Dick et al., 2006
# the rownumber of the protein in thermo$protein
ip <- pinfo("LYSC_CHICK")
# its amino acid composition
aa <- pinfo(ip)
# additive charges of unfolded protein at 25, 100, 150 degrees C
# as a function of pH
pH <- seq(0, 14, 0.1)
Z.25 <- ionize.aa(aa, T=25, pH=pH)
plot(pH, Z.25[, 1], type="l", xlab="pH", ylab="net charge (Z)")
lines(pH, ionize.aa(aa, T=100, pH=pH)[, 1], col="red")
lines(pH, ionize.aa(aa, T=150, pH=pH)[, 1], col="orange")
text(c(12, 10, 9), c(-15, -16, -18),
  labels=paste("T=", c(25, 100, 150), sep=""))
# suppress ionization of cysteine as if it was oxidized 
# (to form non-ionizable cystine disulfide bonds)
lines(pH, ionize.aa(aa, T=25, pH=pH, suppress.Cys=TRUE)[, 1], lty=2)
text(12, -7, "T=25, oxidized")
# add experimental points
RT71 <- read.csv(system.file("extdata/cpetc/RT71.csv", package="CHNOSZ"))
points(RT71$pH, RT71$Z)
legend("topright", pch=1, legend="Roxby and Tanford, 1971")
title(main=paste("Ionization of unfolded LYSC_CHICK\n",
  "After Dick et al., 2006"))

## Heat capacity of LYSC_CHICK as a function of T
pH <- c(5, 9, 3)
T <- seq(0, 100)
# Cp of non-ionized protein
Cp.nonion <- subcrt("LYSC_CHICK", T=T)$out[[1]]$Cp
plot(T, Cp.nonion, xlab=axis.label("T"), type="l",
  ylab=axis.label("Cp"), ylim=c(5000, 8000))
# Cp of ionization and ionized protein
aa <- pinfo(pinfo("LYSC_CHICK"))
for(pH in c(5, 9, 3)) {
  Cp.ionized <- Cp.nonion + ionize.aa(aa, "Cp", T=T, pH=pH)[, 1]
  lines(T, Cp.ionized, lty=2)
  text(80, Cp.ionized[70], paste("pH =",pH) )
}
# Makhatadze and Privalov's group contributions
T <- c(5, 25, 50, 75, 100, 125)
points(T, convert(MP90.cp("LYSC_CHICK", T), "cal"))
# Privalov and Makhatadze's experimental values
e <- read.csv(system.file("extdata/cpetc/PM90.csv", package="CHNOSZ"))
points(e$T, convert(e$LYSC_CHICK, "cal"), pch=16)
legend("bottomright", pch=c(16, 1, NA, NA), lty=c(NA, NA, 1, 2),
  legend=c("PM90 experiment", "MP90 groups", 
  "DLH06 groups no ion", "DLH06 groups ionized"))
title("Heat capacity of unfolded LYSC_CHICK")



