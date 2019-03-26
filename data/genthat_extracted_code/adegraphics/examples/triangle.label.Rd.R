library(adegraphics)


### Name: triangle.label
### Title: Ternary plot with labels
### Aliases: triangle.label
### Keywords: hplot aplot

### ** Examples

data(euro123, package = "ade4")
df <- rbind.data.frame(euro123$in78, euro123$in86, euro123$in97)
row.names(df) <- paste(row.names(euro123$in78), rep(c(1, 2, 3), rep(12, 3)), sep = "")
g1 <- triangle.label(df, label = row.names(df), showposition = TRUE, plot = FALSE)
g2 <- triangle.label(euro123$in78, plabels.cex = 0, ppoints.cex = 2, addmean = TRUE, 
  show = FALSE, plot = FALSE)
g3 <- triangle.label(euro123$in86, labels = row.names(euro123$in78), plabels.cex = 0.8, 
  plot = FALSE)
g4 <- triangle.label(rbind.data.frame(euro123$in78, euro123$in86), plabels.cex = 0.8, 
  addaxes = TRUE, psub.te = "Principal axis", psub.cex = 1.5, psub.pos = "topright", plot = FALSE)
G <- ADEgS(c(g1, g2, g3, g4), layout = c(2, 2))



