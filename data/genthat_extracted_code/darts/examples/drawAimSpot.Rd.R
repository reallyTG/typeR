library(darts)


### Name: drawAimSpot
### Title: Optimal Aiming Spot
### Aliases: drawAimSpot

### ** Examples

# This will take a couple of seconds
e = simpleExpScores(s=0)

# This is what your heatmap would look like if you had perfect accuracy  
par(mfrow=c(1,2))
drawHeatmap(e)
drawBoard(new=TRUE)
drawAimSpot(e)



