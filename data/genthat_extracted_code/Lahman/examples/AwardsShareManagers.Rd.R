library(Lahman)


### Name: AwardsShareManagers
### Title: AwardsShareManagers table
### Aliases: AwardsShareManagers
### Keywords: datasets

### ** Examples

# Voting for the BBWAA Manager of the Year award by year and league

require("dplyr")

# Sort in decreasing order of points by year and league
AwardsShareManagers %>%
   group_by(yearID, lgID) %>%
   arrange(desc(pointsWon))

# Any unanimous winners?
AwardsShareManagers %>%
  filter(pointsWon == pointsMax)

# Manager with highest proportion of possible points
AwardsShareManagers %>%
   mutate(propWon = pointsWon/pointsMax) %>%
   arrange(desc(propWon)) %>%
   head(., 1)

# Bobby Cox's MOY vote tallies
AwardsShareManagers %>%
  filter(playerID == "coxbo01")




