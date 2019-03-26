library(SpatialBall)


### Name: ShotSeasonGraphPlayer
### Title: Generates a shot chart for a given player
### Aliases: ShotSeasonGraphPlayer

### ** Examples

data("season2017")
#Examples with several players
ShotSeasonGraphPlayer(season2017, player = "Stephen Curry")
ShotSeasonGraphPlayer(season2017, player = "DeMar DeRozan")

 #Examples with percentage instead of points per shot
ShotSeasonGraphPlayer(season2017, player = "Stephen Curry", type = "PCT")



