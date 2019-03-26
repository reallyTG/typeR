library(ade4)


### Name: statis
### Title: STATIS, a method for analysing K-tables
### Aliases: statis print.statis plot.statis
### Keywords: multivariate

### ** Examples

data(jv73)
kta1 <- ktab.within(withinpca(jv73$morpho, jv73$fac.riv, scann = FALSE))
statis1 <- statis(kta1, scann = FALSE)
plot(statis1)

dudi1 <- dudi.pca(jv73$poi, scann = FALSE, scal = FALSE)
wit1 <- wca(dudi1, jv73$fac.riv, scann = FALSE)
kta3 <- ktab.within(wit1)
data(jv73)
statis3 <- statis(kta3, scann = FALSE)
plot(statis3)

if(adegraphicsLoaded()) {
  s.arrow(statis3$C.li, pgrid.text.cex = 0)
  kplot(statis3, traj = TRUE, arrow = FALSE, plab.cex = 0, psub.cex = 3, ppoi.cex = 3)
} else {
  s.arrow(statis3$C.li, cgrid = 0)
  kplot(statis3, traj = TRUE, arrow = FALSE, unique = TRUE, 
    clab = 0, csub = 3, cpoi = 3)
}

statis3



