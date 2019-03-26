library(darts)


### Name: generalExpScores
### Title: Expected Scores for the General Model
### Aliases: generalExpScores

### ** Examples

# Generate the matrix of expected scores if my covariance is
# Sig=c(15^2,30^2,0), in the general model. This will take a
# couple of seconds. 
e = generalExpScores(Sig=(c(15^2,30^2,0)))

# Draw a heatmap!
drawHeatmap(e)



