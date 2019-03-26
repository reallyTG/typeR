library(PASWR2)


### Name: BABERUTH
### Title: George Herman Ruth
### Aliases: BABERUTH
### Keywords: datasets

### ** Examples

ggplot(data = BABERUTH, aes(x = ba)) + geom_histogram(binwidth = 0.03) + 
facet_grid(team ~ .) + labs(x = "Batting average")
ggplot(data = BABERUTH, aes(x = g, y = ab, color = rbi)) + geom_point() + 
labs(x = "Number of Games Played", y = "Times at Bat", color = "Runs\n Batted In", 
title = "George Herman Ruth")



