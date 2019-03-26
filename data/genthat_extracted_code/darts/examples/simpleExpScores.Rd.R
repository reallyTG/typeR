library(darts)


### Name: simpleExpScores
### Title: Expected Scores for the Simple Model
### Aliases: simpleExpScores

### ** Examples

# Generate the matrix of expected scores if my variance is 25^2,
# in the simple model. This will take a couple of seconds.
e = simpleExpScores(s=25^2)

# Draw a heatmap!
drawHeatmap(e)



