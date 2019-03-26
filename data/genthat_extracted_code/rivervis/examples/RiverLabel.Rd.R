library(rivervis)


### Name: RiverLabel
### Title: River Labels on River Charts
### Aliases: RiverLabel
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)
RiverDraw(riverlayout)

RiverLabel(riverlayout, corner = "lt", srt = 0, adj = c(0, -0.7))

RiverLabel(riverlayout, corner = "lb")

RiverLabel(riverlayout, corner = "rt", srt = -90)



