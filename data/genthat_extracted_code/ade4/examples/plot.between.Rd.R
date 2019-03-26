library(ade4)


### Name: between
### Title: Between-Class Analysis
### Aliases: summary.between print.between plot.between print.betcoi
###   plot.betcoi
### Keywords: multivariate

### ** Examples

data(meaudret)

pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 4)
pca2 <- dudi.pca(meaudret$spe, scal = FALSE, scan = FALSE, nf = 4)
bet1 <- bca(pca1, meaudret$design$site, scan = FALSE, nf = 2)
bet2 <- bca(pca2, meaudret$design$site, scan = FALSE, nf = 2)

if(adegraphicsLoaded()) {
  g1 <- s.class(pca1$li, meaudret$design$site, psub.text = "Principal Component Analysis (env)", 
    plot = FALSE)
  g2 <- s.class(pca2$li, meaudret$design$site, psub.text = "Principal Component Analysis (spe)", 
    plot = FALSE)
  g3 <- s.class(bet1$ls, meaudret$design$site, psub.text = "Between sites PCA (env)", 
    plot = FALSE)
  g4 <- s.class(bet2$ls, meaudret$design$site, psub.text = "Between sites PCA (spe)", 
    plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  s.class(pca1$li, meaudret$design$site, sub = "Principal Component Analysis (env)", csub = 1.75)
  s.class(pca2$li, meaudret$design$site, sub = "Principal Component Analysis (spe)", csub = 1.75)
  s.class(bet1$ls, meaudret$design$site, sub = "Between sites PCA (env)", csub = 1.75)
  s.class(bet2$ls, meaudret$design$site, sub = "Between sites PCA (spe)", csub = 1.75)
  par(mfrow = c(1,1))
}

coib <- coinertia(bet1, bet2, scann = FALSE)
plot(coib)



