library(adegraphics)


### Name: table.value
### Title: Heat map-like representation with proportional symbols
### Aliases: table.value
### Keywords: aplot hplot

### ** Examples

## data.frame
data(olympic, package = "ade4")
w <- olympic$tab
w <- data.frame(scale(w))
wpca <- ade4::dudi.pca(w, scann = FALSE)
g1 <- table.value(w, ppoints.cex = 0.5, axis.line = list(col = "darkblue"), 
  axis.text = list(col = "darkgrey"))
  
# update the legend position
update(g1, key = list(space = "left"))
update(g1, key = list(columns = 1))

g2 <- table.value(w, coordsy = rank(wpca$li[, 1]), ppoints.cex = 0.5, 
  axis.line = list(col = "darkblue"), axis.text = list(col = "darkgrey"))
g3 <- table.value(w, coordsy = wpca$li[, 1], coordsx = wpca$co[, 1], ppoints.cex = 0.5, 
  axis.line = list(col = "darkblue"), axis.text = list(col = "darkgrey"))

## distance
data(eurodist)
g5 <- table.value(eurodist, symbol = "circle", 
  ptable.margin = list(bottom = 5, top = 16, left = 5, right = 16))

## Not run: 
##D ## table
##D data(rpjdl, package = "ade4")
##D w <- data.frame(t(rpjdl$fau))
##D wcoa <- ade4::dudi.coa(w, scann = FALSE)
##D g6 <- table.value(as.table(as.matrix(w)), meanY = TRUE, coordsx = wcoa$c1[,1], 
##D   coordsy = rank(wcoa$l1[,1]), ppoints.cex = 0.2, labelsx = "", col = "black")
## End(Not run)



