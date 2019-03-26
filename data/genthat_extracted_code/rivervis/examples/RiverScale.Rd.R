library(rivervis)


### Name: RiverScale
### Title: River Chart Scale
### Aliases: RiverScale
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverScale(2, "2 km", riverlayout, loc = c(0.8, 0.10),lbl.cex = 0.8)

# Use mouse to allocate the river scale
## RiverScale(2, "2 km", riverlayout, lbl.cex = 0.8)



