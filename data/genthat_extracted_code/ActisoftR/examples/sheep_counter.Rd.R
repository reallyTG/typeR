library(ActisoftR)


### Name: sheep_counter
### Title: Sheep counter
### Aliases: sheep_counter

### ** Examples

# Example 1:
data(act)
# Prob of being sleeping for ID 1 during the baseline sleep
b <- act[act$subject_ID==1 & act$datime_end < as.POSIXct("2017-12-15 00:00:00", tz = "UTC"),]
sheep_counter(b)




