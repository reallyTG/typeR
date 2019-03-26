library(rivervis)


### Name: RiverBlock
### Title: River Block-Chart
### Aliases: RiverBlock
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverBlock(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
           B.sitehm[4:9], riverlayout, c(1,1,2,2),
           block.col = fivecolours, lbl.adj = c(0.5,1.3))

RiverDraw(riverlayout)

RiverBlock(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
           B.sitehm[4:9], riverlayout, c(1,1,2,2),
           block.col = fivecolours, lbl.adj = c(0.5,1.3),
           par.txt = c("ChanVeg", "ChanFlow", "BankVegLeft",
                       "Right", "RipLULeft", "Right"))



