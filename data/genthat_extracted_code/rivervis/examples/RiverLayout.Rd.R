library(rivervis)


### Name: RiverLayout
### Title: River Layout Coordinates Calculation
### Aliases: RiverLayout
### Keywords: hplot

### ** Examples

data(Ballinderry)

# River flows right
riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)

# River flows left
riverlayout.left <- RiverLayout(B.river$River,B.river$Length,
                                B.river$Parent,B.river$Position,
                                B.river$Distance)

str(riverlayout)



