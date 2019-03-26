library(adegraphics)


### Name: plotEig
### Title: Plot a barchart of eigen values
### Aliases: plotEig
### Keywords: aplot

### ** Examples

  data(microsatt, package = "ade4")
  w <- ade4::dudi.coa(data.frame(t(microsatt$tab)), scann = FALSE, nf = 3)
  g1 <- s.label(w$co, plot = FALSE)
  g2 <- plotEig(w$eig, w$nf, psub = list(text = "Eigenvalues"), pbackground = list(box = TRUE), 
    plot = FALSE)
  G <- insert(g2, g1, posi = "bottomright", ratio = 0.25)



