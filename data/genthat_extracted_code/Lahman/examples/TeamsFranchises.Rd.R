library(Lahman)


### Name: TeamsFranchises
### Title: TeamFranchises table
### Aliases: TeamsFranchises
### Keywords: datasets

### ** Examples

data(TeamsFranchises)

# Which of the active Major League Baseball teams had a National Association predecessor?

# Notes: 
# - the National Association was founded in 1871, and continued through the
# 1875 season. In 1876, six clubs from the National Association and two other
# independent clubs formed the National League, which exists to this day.
# - the `active` field has "NA" for the National Association franchises
# - where appropriate, the `NAassoc` field has the `franchID` of the successor National League team

# using the dplyr data manipulation package
library("dplyr")

NatAssoc_active_table <- TeamsFranchises %>%
  filter(active == "Y") %>%
  filter(!is.na(NAassoc))
NatAssoc_active_table

# Merge current team IDs with franchise IDs
currentTeams <- Teams %>% 
                  filter(yearID == 2014) %>%
                  select(teamID, franchID, lgID, park)

# Merge TeamsFranchises with currentTeams
TeamsFranchises %>%
    filter(active == "Y") %>%
    select(-active, -NAassoc) %>%
    left_join(currentTeams, by = "franchID")



