library(rivervis)


### Name: RiverTM
### Title: Tick Marks on River Charts
### Aliases: RiverTM
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverPoint(NA,B.elevation$River, B.elevation$Distance,
           B.elevation$Elevation, riverlayout)

RiverTM(c(0, 100, 200, 300, 400, 500), B.elevation[3], riverlayout,
        pos=-1, side = "R", range = c(0,500),
        label = c(0, 100, 200, 300, 400, 500))



