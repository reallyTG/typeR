library(rivervis)


### Name: RiverDraw
### Title: River Chart Plotting
### Aliases: RiverDraw
### Keywords: hplot

### ** Examples

data(Ballinderry)

# River flows right
riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

# River flows left
riverlayout.left <- RiverLayout(B.river$River,B.river$Length,
                                B.river$Parent,B.river$Position,
                                B.river$Distance)

RiverDraw(riverlayout.left)



