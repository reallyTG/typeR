library(plyr)


### Name: summarise
### Title: Summarise a data frame.
### Aliases: summarise summarize
### Keywords: manip

### ** Examples

# Let's extract the number of teams and total period of time
# covered by the baseball dataframe
summarise(baseball,
 duration = max(year) - min(year),
 nteams = length(unique(team)))
# Combine with ddply to do that for each separate id
ddply(baseball, "id", summarise,
 duration = max(year) - min(year),
 nteams = length(unique(team)))



