library(SpatialBall)


### Name: PointShotSeasonGraphPlayer
### Title: Generates a point based shot chart for a given player
### Aliases: PointShotSeasonGraphPlayer

### ** Examples

data("season2017")
#Examples with several players
PointShotSeasonGraphPlayer(season2017, player = "James Harden")
PointShotSeasonGraphPlayer(season2017, player = "DeMar DeRozan")

PointShotSeasonGraphPlayer(season2017, player = "Stephen Curry", kernel = FALSE)



