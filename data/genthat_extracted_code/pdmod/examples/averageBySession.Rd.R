library(pdmod)


### Name: averageBySession
### Title: Average by session
### Aliases: averageBySession

### ** Examples

# Create vector of values (i.e. estimates, respones, etc.)
values = runif(100)
# Specify sessions, here a group of 10 trials
sessionBoundaries = seq(1, 101, 10)
valuesBySession = averageBySession(values, sessionBoundaries)



