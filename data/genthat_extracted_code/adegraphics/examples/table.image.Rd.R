library(adegraphics)


### Name: table.image
### Title: Heat map-like representation with colored cells
### Aliases: table.image
### Keywords: aplot hplot

### ** Examples

tab <- as.table(matrix(rnorm(900), ncol = 30))
g1 <- table.image(tab)

# add a continuous color bar as legend
# update(g1, plegend.drawColorKey = TRUE)

g2 <- table.image(tab, n = 100, coordsx = c(30, 1:29), plegend.drawKey = FALSE)

data(rpjdl, package = "ade4")
X <- data.frame(t(rpjdl$fau))
Y <- data.frame(t(rpjdl$mil))
coa1 <- ade4::dudi.coa(X, scannf = FALSE)
g3 <- table.image(Y, coordsx = rank(coa1$co[, 1]), coordsy = 1:8, nclas = 5, 
  labelsx = "", plegend.drawKey = FALSE)



