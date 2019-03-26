library(ade4)


### Name: ktab.list.dudi
### Title: Creation of a K-tables from a list of duality diagrams
### Aliases: ktab.list.dudi
### Keywords: multivariate

### ** Examples

data(euro123)
pca1 <- dudi.pca(euro123$in78, scale = FALSE, scann = FALSE)
pca2 <- dudi.pca(euro123$in86, scale = FALSE, scann = FALSE)
pca3 <- dudi.pca(euro123$in97, scale = FALSE, scann = FALSE)
ktabeuro <- ktab.list.dudi(list(pca1, pca2, pca3), 
    tabnames = c("1978", "1986", "1997"))
if(adegraphicsLoaded()) {
  kplot(sepan(ktabeuro))
} else {
  kplot(sepan(ktabeuro), mfr = c(2, 2), clab.c = 1.5)
}

data(meaudret)
w1 <- split(meaudret$env,meaudret$design$season)
ll <- lapply(w1, dudi.pca, scann = FALSE)
kta <- ktab.list.dudi(ll, rownames <- paste("Site", 1:5, sep = ""))
if(adegraphicsLoaded()) {
  kplot(sepan(kta), row.plab.cex = 1.5, col.plab.cex = 0.75)
} else {
  kplot(sepan(kta), clab.r = 1.5, clab.c = 0.75)
}

data(jv73)
w <- split(jv73$poi, jv73$fac.riv)
wjv73poi <- lapply(w, dudi.pca, scal = FALSE, scan = FALSE)
wjv73poi <- lapply(wjv73poi, t)
wjv73poi <- ktab.list.dudi(wjv73poi)
kplot(sepan(wjv73poi), permut = TRUE, traj = TRUE)



