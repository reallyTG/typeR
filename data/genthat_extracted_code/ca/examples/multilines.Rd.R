library(ca)


### Name: multilines
### Title: Draw lines for groups distinguished by a factor
### Aliases: multilines
### Keywords: aplot

### ** Examples

if (require(vcd)) {
  data(PreSex, package="vcd")
  presex.mca <- mjca(PreSex)
  res <- plot(presex.mca, labels=0, pch='.', cex.lab=1.2)
  coords <- data.frame(res$cols, presex.mca$factors)      
  nlev <- rle(as.character(coords$factor))$lengths
  fact <- unique(as.character(coords$factor))
  
  cols <- c("blue", "red", "brown", "black")
  lwd <- c(2, 2, 2, 4)
  
  plot(Dim2 ~ Dim1, type='n', data=coords)
  points(coords[,1:2], pch=rep(16:19, nlev), col=rep(cols, nlev), cex=1.2)
  text(coords[,1:2], labels=coords$level, col=rep(cols, nlev), pos=3, cex=1.2, xpd=TRUE)
  
  multilines(coords[, c("Dim1", "Dim2")], group=coords$factor, col=cols, lwd=lwd)
}




