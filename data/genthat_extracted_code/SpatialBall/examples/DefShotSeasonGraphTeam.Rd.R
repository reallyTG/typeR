library(SpatialBall)


### Name: DefShotSeasonGraphTeam
### Title: Generates an defensive shot chart for a given team
### Aliases: DefShotSeasonGraphTeam

### ** Examples

data("season2017")
#Examples with several teams
DefShotSeasonGraphTeam(season2017, team = "Sas")
DefShotSeasonGraphTeam(season2017, team = "Cle")
#Examples with shooting percentage instead of Points per Shot
DefShotSeasonGraphTeam(season2017, team = "Cle", type = "PCT")



