library(POT)


### Name: dens
### Title: Density Plot: Univariate Case
### Aliases: dens dens.uvpot
### Keywords: hplot

### ** Examples

x <- rgpd(75, 1, 2, 0.1)
pwmu <- fitgpd(x, 1, "pwmu")
dens(pwmu)



