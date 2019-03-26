library(ade4)


### Name: kplot.statis
### Title: Multiple Graphs of a STATIS Analysis
### Aliases: kplot.statis
### Keywords: multivariate hplot

### ** Examples

data(jv73)
dudi1 <- dudi.pca(jv73$poi, scann = FALSE, scal = FALSE)
wit1 <- wca(dudi1, jv73$fac.riv, scann = FALSE)
kta1 <- ktab.within(wit1)
statis1 <- statis(kta1, scann = FALSE)

if(adegraphicsLoaded()) {
  g1 <- kplot(statis1, traj = TRUE, arrow = FALSE, plab.cex = 0, psub.cex = 2, ppoi.cex = 2)
} else {
  kplot(statis1, traj = TRUE, arrow = FALSE, unique = TRUE, clab = 0, csub = 2, cpoi = 2)
}


