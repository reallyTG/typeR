library(adegraphics)


### Name: zoom
### Title: Zoom in or out
### Aliases: zoom zoom-methods zoom,ADEg.S1,numeric,missing-method
###   zoom,ADEg.S1,numeric,numeric-method
###   zoom,ADEg.S2,numeric,missing-method
###   zoom,ADEg.S2,numeric,numeric-method
### Keywords: iplot

### ** Examples

data(olympic, package = "ade4")
dudi1 <- ade4::dudi.pca(olympic$tab, scan = FALSE)
g <- s.corcircle(dudi1$co, lab = names(olympic$tab), fullcircle = TRUE, psub.text = "data:olympic")
zoom(g, 0.5)
zoom(g, 2, center = c(-0.4, 0.8))



