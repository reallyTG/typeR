library(ade4)


### Name: niche
### Title: Method to Analyse a pair of tables : Environmental and Faunistic
###   Data
### Aliases: niche plot.niche print.niche niche.param rtest.niche
### Keywords: multivariate

### ** Examples

data(doubs)
dudi1 <- dudi.pca(doubs$env, scale = TRUE, scan = FALSE, nf = 3)
nic1 <- niche(dudi1, doubs$fish, scann = FALSE)

if(adegraphicsLoaded()) {
  g1 <- s.traject(dudi1$li, plab.cex = 0, plot = FALSE)
  g2 <- s.traject(nic1$ls, plab.cex = 0, plot = FALSE)
  g3 <- s.corcircle(nic1$as, plot = FALSE)
  g4 <- s.arrow(nic1$c1, plot = FALSE)
  G1 <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
  glist <- list()
  for(i in 1:ncol(doubs$fish))
    glist[[i]] <- s.distri(nic1$ls, dfdistri = doubs$fish[, i], psub.text = names(doubs$fish)[i], 
      plot = FALSE, storeData = TRUE)
  G2 <- ADEgS(glist, layout = c(5, 6))
  
  G3 <- s.arrow(nic1$li, plab.cex = 0.7)  
    
} else {
  par(mfrow = c(2, 2))
  s.traject(dudi1$li, clab = 0)
  s.traject(nic1$ls, clab = 0)
  s.corcircle(nic1$as)
  s.arrow(nic1$c1)

  par(mfrow = c(5, 6))
  for (i in 1:27) s.distri(nic1$ls, as.data.frame(doubs$fish[,i]),
    csub = 2, sub = names(doubs$fish)[i])
    
  par(mfrow = c(1, 1))
  s.arrow(nic1$li, clab = 0.7)

}

data(trichometeo)
pca1 <- dudi.pca(trichometeo$meteo, scan = FALSE)
nic1 <- niche(pca1, log(trichometeo$fau + 1), scan = FALSE)
plot(nic1)
niche.param(nic1)
rtest(nic1,19)

data(rpjdl)
plot(niche(dudi.pca(rpjdl$mil, scan = FALSE), rpjdl$fau, scan = FALSE))



