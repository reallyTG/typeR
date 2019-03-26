library(rivervis)


### Name: RiverFrame
### Title: River Frame Plotting
### Aliases: RiverFrame
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverFrame(riverlayout, bd.col = "green",
           pt.col = "red", ln.col = "orange")



