library(rivervis)


### Name: RiverMap
### Title: River Layout Coordinates Calculation and Plotting
### Aliases: RiverMap
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
str(riverlayout)

RiverMap(B.river$River,B.river$Length,B.river$Parent,
         B.river$Position, B.river$Distance)[[1]]

RiverMap(B.river$River,B.river$Length,B.river$Parent,
         B.river$Position, B.river$Distance,
         row = c(5,-1,6,3,-4,2,-6,7), direction = -1)



