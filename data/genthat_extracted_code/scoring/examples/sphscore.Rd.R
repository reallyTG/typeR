library(scoring)


### Name: sphscore
### Title: Calculate Spherical Scores
### Aliases: sphscore

### ** Examples

data("WorldEvents")
## Raw spherical scores
sph1 <- sphscore(answer ~ forecast, data=WorldEvents)
## Raw spherical scores plus group means
sph2 <- sphscore(answer ~ forecast, data=WorldEvents,
                 group="forecaster")



