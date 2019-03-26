library(rivervis)


### Name: RiverAxisLabel
### Title: River Axis Labels
### Aliases: RiverAxisLabel
### Keywords: hplot

### ** Examples

# see examples below
data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverBar(B.siteaspt$Site, B.siteaspt$River, B.siteaspt$Distance,
         B.siteaspt[4:5], riverlayout, range = c(0,8),
         bar.col = c("#5381FFFF", "#FF3931FF"), lbl.adj = c(0.5,1.3))

RiverTM(c(0,2,4,6,8,10), B.siteaspt[4:5], riverlayout,
        pos=-1, side = "L", range = c(0,8), label = c(0,2,4,6,8))

RiverAxisLabel("ASPT score", riverlayout, adj = c(0.5, -3))



