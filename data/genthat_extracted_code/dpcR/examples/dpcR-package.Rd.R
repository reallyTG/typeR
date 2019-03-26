library(dpcR)


### Name: dpcR-package
### Title: Digital PCR Analysis
### Aliases: dpcR-package dpcR
### Keywords: package

### ** Examples


adpcr <- sim_adpcr(m = 400, n = 765, times = 20, pos_sums = FALSE, n_panels = 1)
plot_panel(adpcr, col = "green")
pos_chambers <- sum(adpcr > 0)
dpcr_density(k = pos_chambers, n = 765)




