library(adegraphics)


### Name: s1d.distri
### Title: 1-D plot of a numeric score by means/standard deviations
###   computed using an external table of weights
### Aliases: s1d.distri
### Keywords: aplot hplot

### ** Examples

w <- seq(-1, 1, le = 200)
distri <- data.frame(lapply(1:50, 
  function(x) sample(200:1) * ((w >= (- x / 50)) & (w <= x / 50))))
names(distri) <- paste("w", 1:50, sep = "")
g11 <- s1d.distri(w, distri, yrank = TRUE, sdS = 1.5, plot = FALSE)
g12 <- s1d.distri(w, distri, yrank = FALSE, sdS = 1.5, plot = FALSE)
G1 <- ADEgS(c(g11, g12), layout = c(1, 2))

data(rpjdl, package = "ade4")
coa1 <- ade4::dudi.coa(rpjdl$fau, scannf = FALSE)
G2 <- s1d.distri(coa1$li[,1], rpjdl$fau, labels = rpjdl$frlab, 
  plabels = list(cex = 0.8, boxes = list(draw = FALSE)))

## Not run: 
##D g31 <- s1d.distri(coa1$l1[,1], rpjdl$fau, plabels = list(cex = 0.8, boxes = list(draw = FALSE)), 
##D   plot = FALSE)
##D nsc1 <- ade4::dudi.nsc(rpjdl$fau, scannf = FALSE)
##D g32 <- s1d.distri(nsc1$l1[,1], rpjdl$fau, plabels = list(cex = 0.8, boxes = list(draw = FALSE)), 
##D   plot = FALSE)
##D g33 <- s.label(coa1$l1, plot = FALSE)
##D g34 <- s.label(nsc1$l1, plot = FALSE)
##D G3 <- ADEgS(c(g31, g32, g33, g34), layout = c(2, 2))
## End(Not run) 



