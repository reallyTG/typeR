library(ade4)


### Name: wca
### Title: Within-Class Analysis
### Aliases: wca wca.dudi
### Keywords: multivariate

### ** Examples

data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 4)
wit1 <- wca(pca1, meaudret$design$site, scan = FALSE, nf = 2)

if(adegraphicsLoaded()) {
  g1 <- s.traject(pca1$li, meaudret$design$site, psub.text = "Principal Component Analysis", 
    plines.lty = 1:nlevels(meaudret$design$site), psub.cex = 1.5, plot = FALSE)
  g2 <- s.traject(wit1$li, meaudret$design$site, 
    psub.text = "Within site Principal Component Analysis", 
    plines.lty = 1:nlevels(meaudret$design$site), psub.cex = 1.5, plot = FALSE)
  g3 <- s.corcircle (wit1$as, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  s.traject(pca1$li, meaudret$design$site, sub = "Principal Component Analysis", csub = 1.5)
  s.traject(wit1$li, meaudret$design$site, sub = "Within site Principal Component Analysis", 
    csub = 1.5)
  s.corcircle (wit1$as)
  par(mfrow = c(1,1))
}
plot(wit1)



