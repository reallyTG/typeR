library(adegraphics)


### Name: plot.inertia
### Title: Display the decomposition of inertia which measure the
###   contributions of rows/columns in mutivariate methods
### Aliases: plot.inertia score.inertia
### Keywords: hplot methods

### ** Examples

# First example
data(bf88, package = "ade4")
coa1 <- ade4::dudi.coa(bf88$S1, scannf = FALSE, nf = 2)

###### row=T / col=F
res11 <- ade4::inertia(coa1, row = TRUE, col = FALSE, nf = 2)
g11 <- plot(res11, threshold = 0.06)
g12 <- plot(res11, threshold = 0.06, plabels.boxes.draw = TRUE, plines.lwd = 0,
  light_row.ppoints.cex = 0, posieig = "bottomleft")
g13 <- score(res11, threshold = 0.06)
names(g13)
g14 <- score(res11, xax = 2, threshold = 0.06)

###### row=F / col=T
res12 <- ade4::inertia(coa1, row = FALSE, col = TRUE, nf = 2)
res12$col.abs
idx <- which(res12$col.abs[, 1]/100 >= 0.1 | res12$col.abs[, 2]/100 >= 0.1)
rownames(res12$col.abs[idx, ])
coa1$co[idx, ]
g15 <- plot(res12)
g16 <- score(res12, threshold = 0.08)
g17 <- score(res12, threshold = 0.07)


########################################
########################################
# Second example
data(housetasks, package = "ade4")
coa2 <- ade4::dudi.coa(housetasks, scann = FALSE)

###### row=T / col=F
res21 <- ade4::inertia(coa2, row = TRUE, col = FALSE)
g21 <- plot(res21)
g22 <- score(res21)
g23 <- score(res21, xax = 2)

###### row=F / col=T
res22 <- ade4::inertia(coa2, row = FALSE, col = TRUE)
g24 <- plot(res22, plabels.cex = 2)
names(g24)
g25 <- plot(res22, posieig = "topleft")
names(g25)
g26 <- plot(res22, heavy_col.plabels.box.draw = TRUE, 
  light_col.ppoints.col = "purple")
g27 <- plot(res22, type = "both")
g28 <- plot(res22, type = "ellipse", ellipseSize = 3, plabels.col = "black", 
  pellipse.col = "purple", pellipses.border = "black")



