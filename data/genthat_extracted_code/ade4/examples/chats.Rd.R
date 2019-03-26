library(ade4)


### Name: chats
### Title: Pair of Variables
### Aliases: chats
### Keywords: datasets

### ** Examples

data(chats)
chatsw <- as.table(t(chats))
chatscoa <- dudi.coa(data.frame(t(chats)), scann = FALSE)

if(adegraphicsLoaded()) {
  g1 <- table.value(chatsw, ppoints.cex = 1.3, meanX = TRUE, ablineX = TRUE, plabel.cex = 1.5, 
    plot = FALSE)
  g2 <- table.value(chatsw, ppoints.cex = 1.3, meanY = TRUE, ablineY = TRUE, plabel.cex = 1.5, 
    plot = FALSE)
  g3 <- table.value(chatsw, ppoints.cex = 1.3, coordsx = chatscoa$c1[,
  1], coordsy = chatscoa$l1[, 1], meanX = TRUE, ablineX = TRUE, plot = FALSE)
  g4 <- table.value(chatsw, ppoints.cex = 1.3, meanY = TRUE, ablineY = TRUE, 
    coordsx = chatscoa$c1[, 1], coordsy = chatscoa$l1[, 1], plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))

} else {
  par(mfrow = c(2, 2))
  table.cont(chatsw, abmean.x = TRUE, csi = 2, abline.x = TRUE, clabel.r = 1.5, clabel.c = 1.5)
  table.cont(chatsw, abmean.y = TRUE, csi = 2, abline.y = TRUE, clabel.r = 1.5, clabel.c = 1.5)
  table.cont(chatsw, x = chatscoa$c1[, 1], y = chatscoa$l1[, 1], abmean.x = TRUE, csi = 2, 
    abline.x = TRUE, clabel.r = 1.5, clabel.c = 1.5)
  table.cont(chatsw, x = chatscoa$c1[, 1], y = chatscoa$l1[, 1], abmean.y = TRUE, csi = 2, 
    abline.y = TRUE, clabel.r = 1.5, clabel.c = 1.5)
  par(mfrow = c(1, 1))
}


