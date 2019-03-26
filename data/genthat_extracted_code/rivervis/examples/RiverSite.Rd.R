library(rivervis)


### Name: RiverSite
### Title: Site of Interest
### Aliases: RiverSite
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverSite(B.soi$SOI, B.soi$River, B.soi$Distance, B.soi$Group, riverlayout,
          pt.bg = c("red","green","yellow"), lbl.shw = FALSE)

RiverDraw(riverlayout)

RiverSite(B.town$Town, B.town$River, B.town$Distance, B.town$Group,
          riverlayout, pt.pch = 22, lbl.shw = FALSE,
          pt.bg = "orange", pt.col = "black")

RiverSite(B.soi$SOI, B.soi$River, B.soi$Distance, B.soi$Group,
          riverlayout, pt.pch = c(25, 24, NA),
          lbl.shw = FALSE, pt.bg = NA, pt.col = "black")



