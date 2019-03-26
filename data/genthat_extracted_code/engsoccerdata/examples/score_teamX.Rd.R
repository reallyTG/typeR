library(engsoccerdata)


### Name: score_teamX
### Title: List all occurrences of a specific scoreline for a specific team
### Aliases: score_teamX

### ** Examples

score_teamX(england,"4-4", "Tottenham Hotspur")
#all 4-4 draws Tottenham Hotspur have played in (home and away)

score_teamX(england,"3-5", "York City")
#list all 5-3 defeats suffered by York City (regardless of if occurred home/away)

score_teamX(england,"5-3", "York City")
#list all 5-3 victories by York City (regardless of if occurred home/away)

score_teamX(england,"8-0", "Arsenal")
#list all 8-0 victories by Arsenal (regardless of if occurred home/away)

score_teamX(england,"0-8", "Arsenal")
#list all 8-0 defeats suffered by Arsenal (regardless of if occurred home/away)



