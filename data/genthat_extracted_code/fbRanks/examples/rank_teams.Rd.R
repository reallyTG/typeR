library(fbRanks)


### Name: rank.teams
### Title: Team Ranks Via Poission Regression
### Aliases: fbRanks rank.teams

### ** Examples

#load the example data set
data(B00data)

#rank teams in the RCL D1 league using just the league data
x=rank.teams(scores=B00.scores, teams=B00.teams, venue="RCL D1")

#repeat with surface (turf, grass) as an explanatory variable
ranks2=rank.teams(scores=B00.scores, teams=B00.teams, venue="RCL D1", add=c("surface","adv"))

#Slightly fewer goals per game are scored on turf
coef(ranks2)$coef.list$cluster.1$surface.f

#Slightly more goals per game are scored at home
coef(ranks2)$coef.list$cluster.1$adv.f

#get the ranks based on summer data
# x=rank.teams(scores=B00.scores, teams=B00.teams, 
#              min.date="2012-5-1", max.date="2012-9-8", silent=TRUE)

# See the vignette Basic Team Ranking for more examples




