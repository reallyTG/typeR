library(ade4)


### Name: table.cont
### Title: Plot of Contingency Tables
### Aliases: table.cont
### Keywords: hplot

### ** Examples

data(chats)
chatsw <- data.frame(t(chats))
chatscoa <- dudi.coa(chatsw, scann = FALSE)
par(mfrow = c(2,2))
table.cont(chatsw, abmean.x = TRUE, csi = 2, abline.x = TRUE, 
    clabel.r = 1.5, clabel.c = 1.5)
table.cont(chatsw, abmean.y = TRUE, csi = 2, abline.y = TRUE, 
    clabel.r = 1.5, clabel.c = 1.5)
table.cont(chatsw, x = chatscoa$c1[,1], y = chatscoa$l1[,1],
    abmean.x = TRUE, csi = 2, abline.x = TRUE, clabel.r = 1.5, clabel.c = 1.5)
table.cont(chatsw, x = chatscoa$c1[,1], y = chatscoa$l1[,1],
    abmean.y = TRUE, csi = 2, abline.y = TRUE, clabel.r = 1.5, clabel.c = 1.5)
par(mfrow = c(1,1))

## Not run: 
##D data(rpjdl)
##D w <- data.frame(t(rpjdl$fau))
##D wcoa <- dudi.coa(w, scann = FALSE)
##D table.cont(w, abmean.y = TRUE, x = wcoa$c1[,1], y = rank(wcoa$l1[,1]),
##D     csi = 0.2, clabel.c = 0, row.labels = rpjdl$lalab, clabel.r = 0.75)
## End(Not run)


