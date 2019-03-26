library(BSDA)


### Name: Maze
### Title: Error scores for four groups of experimental animals running a
###   maze
### Aliases: Maze
### Keywords: datasets

### ** Examples


boxplot(score ~ condition, data = Maze, col = rainbow(4))
anova(lm(score ~ condition, data = Maze))




