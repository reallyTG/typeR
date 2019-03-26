library(Lahman)


### Name: TeamsHalf
### Title: TeamsHalf table
### Aliases: TeamsHalf
### Keywords: datasets

### ** Examples

# 1981 season team data split into half seasons
data(TeamsHalf)
library("dplyr")

# List standings with winning percentages by
# season half, league and division
TeamsHalf %>%
   group_by(Half, lgID, divID) %>%
   mutate(WinPct = round(W/G, 3)) %>%
   arrange(Half, lgID, divID, Rank) %>%
   select(Half, lgID, divID, Rank, teamID, WinPct)




