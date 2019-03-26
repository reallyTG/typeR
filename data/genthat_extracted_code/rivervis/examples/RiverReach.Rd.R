library(rivervis)


### Name: RiverReach
### Title: River Reach Plotting
### Aliases: RiverReach
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverReach(B.reach$Reach, B.reach$River, B.reach$From,
           B.reach$To, B.reach$Group, B.reach$Style, riverlayout,
           rea.lwd = 5)

RiverReach(B.reach$Reach, B.reach$River, B.reach$From,
           B.reach$To, B.reach$Group, 2, riverlayout,
           rea.col = "darkred", rea.lwd = 5)



