library(timelineS)


### Name: timelineS
### Title: Timeline with Event Labels
### Aliases: timelineS

### ** Examples

### Default down-up labels
timelineS(mj_life, main = "Life of Michael Jackson")

### Labels above timeline and other change in aesthetics
timelineS(mj_life, main = "Life of Michael Jackson",
label.direction = "up", label.length = c(0.2,0.8,0.4,1.2), label.position = 3,
line.color = "blue", label.color = "blue", point.color = "blue", pch = "-")




