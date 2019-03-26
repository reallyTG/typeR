library(ade4)


### Name: within
### Title: Within-Class Analysis
### Aliases: print.within summary.within plot.within plot.witcoi
###   print.witcoi
### Keywords: multivariate

### ** Examples

data(meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE, nf = 4)
wit1 <- wca(pca1, meaudret$design$site, scan = FALSE, nf = 2)

if(adegraphicsLoaded()) {
  g1 <- s.traject(pca1$li, meaudret$design$site, psub.text = "Principal Component Analysis", 
    plines.lty = 1:length(levels(meaudret$design$site)), plot = FALSE)
  g2 <- s.traject(wit1$li, meaudret$design$site, psub.text = 
    "Within site Principal Component Analysis", 
    plines.lty = 1:length(levels(meaudret$design$site)), plot = FALSE)
  g3 <- s.corcircle (wit1$as, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  s.traject(pca1$li, meaudret$design$site, sub = "Principal Component Analysis", csub = 1.5)
  s.traject(wit1$li, meaudret$design$site, sub = "Within site Principal Component Analysis", 
    csub = 1.5)
  s.corcircle (wit1$as)
  par(mfrow = c(1, 1))
}

plot(wit1)



