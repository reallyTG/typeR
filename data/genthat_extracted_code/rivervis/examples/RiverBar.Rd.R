library(rivervis)


### Name: RiverBar
### Title: River Bar-Chart
### Aliases: RiverBar
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)

RiverDraw(riverlayout)

RiverBar(B.siteaspt$Site, B.siteaspt$River, B.siteaspt$Distance,
         B.siteaspt[4], riverlayout, range = c(0,8),
         bar.col = c("#5381FFFF"), lbl.adj = c(0.5,1.3))

RiverDraw(riverlayout)

RiverBar(B.siteaspt$Site, B.siteaspt$River, B.siteaspt$Distance,
         B.siteaspt[4:5], riverlayout, range = c(0,8),
         bar.col = c("#5381FFFF", "#FF3931FF"), lbl.adj = c(0.5,1.3))



