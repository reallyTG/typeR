library(adegraphics)


### Name: insert
### Title: Insert a graphic into an existing one
### Aliases: insert insert-methods insert,ADEgORtrellis,missing-method
###   insert,ADEgS,missing-method insert,ADEgORtrellis,ADEg-method
###   insert,ADEgS,ADEg-method insert,ADEgORtrellis,ADEgS-method
###   insert,ADEgS,ADEgS-method
### Keywords: hplot aplot methods

### ** Examples

data(deug, package = "ade4")
dd1 <- ade4::dudi.pca(deug$tab, scannf = FALSE, nf = 4)
g1 <- s.label(dfxy = dd1$li, labels = rownames(dd1$li), plabels = list(cex = 0.75), plot = FALSE)
g2 <- s1d.barchart(score = dd1$eig, plot = FALSE, 
  ppolygons = list(col = c(rep("black", 2), rep("grey", 2), rep("white", 5))), 
  p1d = list(horizontal = FALSE), psub = list(position = "topright", text = "Eigenvalues"), 
  pgrid = list(draw = FALSE), pbackground = list(box = TRUE), xlim = c(0.5, 9.5))
g1
g3 <- insert(g2, plot = FALSE)

mat <- g3@positions
mat[2, ] <- c(0.8, 0, 1, 0.2)
update(g3, positions = mat, plot = FALSE)
print(g3) ## square == NULL
print(g3, square = TRUE)
print(g3, square = FALSE)

g4 <- insert(g2, g1, posi = "topleft")

data(jv73, package = "ade4")
pca1 <- ade4::dudi.pca(jv73$morpho, scannf = FALSE)
g5 <- s.value(jv73$xy, pca1$li[, 1:2], porigin.include = FALSE, plot = FALSE)
g6 <- s.corcircle(pca1$co, pbackground.box = FALSE, plot = FALSE)
g7 <- insert(g6, g5, posi = c(0.3, 0.4, 0.5, 0.6))



