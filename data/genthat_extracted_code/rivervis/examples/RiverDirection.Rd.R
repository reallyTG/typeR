library(rivervis)


### Name: RiverDirection
### Title: River Direction Arrow
### Aliases: RiverDirection
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverDirection(riverlayout, arw.length = 0.03,
               loc = c(0.8, 0.05), lbl.cex = 0.8)

# Use mouse to allocate the flow direction sign
## RiverDirection(riverlayout, arw.length = 0.03, lbl.cex = 0.8)



