library(ade4)


### Name: witwit.coa
### Title: Internal Correspondence Analysis
### Aliases: witwit.coa summary.witwit witwitsepan
### Keywords: multivariate

### ** Examples

data(ardeche)
coa1 <- dudi.coa(ardeche$tab, scann = FALSE, nf = 4)
ww <- witwit.coa(coa1, ardeche$row.blocks, ardeche$col.blocks, scann = FALSE)
ww
summary(ww)

if(adegraphicsLoaded()) {
  g1 <- s.class(ww$co, ardeche$sta.fac, plab.cex = 1.5, ellipseSi = 0, paxes.draw = FALSE, 
    plot = FALSE)
  g2 <- s.label(ww$co, plab.cex = 0.75, plot = FALSE)
  G <- superpose(g1, g2, plot = TRUE)
  
} else {
  s.class(ww$co, ardeche$sta.fac, clab = 1.5, cell = 0, axesell = FALSE)
  s.label(ww$co, add.p = TRUE, clab = 0.75)
}

witwitsepan(ww, c(4, 6))



