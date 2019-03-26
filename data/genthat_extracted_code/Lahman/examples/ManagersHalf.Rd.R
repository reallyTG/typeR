library(Lahman)


### Name: ManagersHalf
### Title: ManagersHalf table
### Aliases: ManagersHalf
### Keywords: datasets

### ** Examples

library("dplyr")
library("reshape2")

# Only have data for 1892 and 1981

# League rank by half for 1981 teams with the same
# manager in both halves who were hired in-season
ManagersHalf %>% 
  filter(yearID >= 1901) %>%
  group_by(teamID, yearID) %>%
  filter(all(playerID == playerID[1])) %>%  # same manager in both halves
  mutate(winPct = round(W/G, 3)) %>%
  reshape2::dcast(playerID + yearID + teamID + lgID ~ half,
                     value.var = "rank") %>%
  rename(rank1 = `1`, rank2 = `2`) 



