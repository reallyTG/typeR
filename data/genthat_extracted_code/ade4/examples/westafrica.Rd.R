library(ade4)


### Name: westafrica
### Title: Freshwater fish zoogeography in west Africa
### Aliases: westafrica
### Keywords: datasets

### ** Examples

data(westafrica)

if(!adegraphicsLoaded()) {
  s.label(westafrica$cadre, xlim = c(30, 500), ylim = c(50, 290),
    cpoi = 0, clab = 0, grid = FALSE, addax = 0)
  old.par <- par(no.readonly = TRUE)
  par(mar = c(0.1, 0.1, 0.1, 0.1))
  rect(30, 0, 500, 290)
  polygon(westafrica$atlantic, col = "lightblue")
  points(westafrica$riv.xy, pch = 20, cex = 1.5)
  apply(westafrica$lines, 1, function(x) segments(x[1], x[2], x[3], x[4], lwd = 1))
  apply(westafrica$riv.xy,1, function(x) segments(x[1], x[2], x[3], x[4], lwd = 1))
  text(c(175, 260, 460, 420), c(275, 200, 250, 100), c("Senegal", "Niger", "Niger", "Volta"))
  par(srt = 270)
  text(westafrica$riv.xy$x2, westafrica$riv.xy$y2-10, westafrica$riv.names, adj = 0, cex = 0.75)
  par(old.par)
  rm(old.par)
}

# multivariate analysis
afri.w <- data.frame(t(westafrica$tab))
afri.dist <- dist.binary(afri.w,1)
afri.pco <- dudi.pco(afri.dist, scannf = FALSE, nf = 3)
if(adegraphicsLoaded()) {
  G1 <- s1d.barchart(afri.pco$li[, 1:3], p1d.horizontal = FALSE, plabels.cex = 0)
} else {
  par(mfrow = c(3, 1))
  barplot(afri.pco$li[, 1])
  barplot(afri.pco$li[, 2])
  barplot(afri.pco$li[, 3])
}

if(requireNamespace("spdep", quietly = TRUE)) {
  # multivariate spatial analysis
  afri.neig <- neig(n.line = 33)
  afri.nb <- neig2nb(afri.neig)
  afri.listw <- spdep::nb2listw(afri.nb)
  afri.ms <- multispati(afri.pco, afri.listw, scannf = FALSE, nfposi = 6, nfnega = 0)
  
  if(adegraphicsLoaded()) {
    G2 <- s1d.barchart(afri.ms$li[, 1:3], p1d.horizontal = FALSE, plabels.cex = 0)
    
    g31 <- s.label(afri.ms$li, plabels.cex = 0.75, ppoints.cex = 0, nb = afri.nb, plot = FALSE)
    g32 <- s.value(afri.ms$li, afri.ms$li[, 3], plot = FALSE)
    g33 <- s.value(afri.ms$li, afri.ms$li[, 4], plot = FALSE)
    g34 <- s.value(afri.ms$li, afri.ms$li[, 5], plot = FALSE)
    G3 <- ADEgS(list(g31, g32, g33, g34), layout = c(2, 2))
    
  } else {
    par(mfrow = c(3, 1))
    barplot(afri.ms$li[, 1])
    barplot(afri.ms$li[, 2])
    barplot(afri.ms$li[, 3])
    
    par(mfrow = c(2, 2))
    s.label(afri.ms$li, clab = 0.75, cpoi = 0, neig = afri.neig, cneig = 1.5)
    s.value(afri.ms$li, afri.ms$li[, 3])
    s.value(afri.ms$li, afri.ms$li[, 4])
    s.value(afri.ms$li, afri.ms$li[, 5])
  }
  summary(afri.ms)
}

par(mfrow = c(1, 1))
plot(hclust(afri.dist, "ward.D"), h = -0.2)



