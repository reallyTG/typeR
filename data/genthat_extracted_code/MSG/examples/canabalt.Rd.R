library(MSG)


### Name: canabalt
### Title: The scores of the game Canabalt from Twitter
### Aliases: canabalt

### ** Examples

library(ggplot2)
data(canabalt)
print(qplot(device, score, data = canabalt))
print(qplot(reorder(death, score, median), score, data = canabalt, geom = "boxplot") + 
    coord_flip())



