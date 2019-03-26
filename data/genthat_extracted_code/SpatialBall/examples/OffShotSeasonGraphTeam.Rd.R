library(SpatialBall)


### Name: OffShotSeasonGraphTeam
### Title: Generates an offensive shot chart for a given team
### Aliases: OffShotSeasonGraphTeam

### ** Examples

data("season2017")
#Examples with several teams
OffShotSeasonGraphTeam(season2017, team = "GSW")
OffShotSeasonGraphTeam(season2017, team = "Hou")
#Examples with shooting percentage instead of Points per Shot
OffShotSeasonGraphTeam(season2017, team = "ORL", type = "PCT")



