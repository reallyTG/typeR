library(nlstimedist)


### Name: timedist
### Title: Fit the Franco model
### Aliases: timedist

### ** Examples

tdTilia <- tdData(tilia, x = "Day", y = "Trees")
model <- timedist(data = tdTilia, x = "Day", y = "propMax", r = 0.1, c = 0.5,
                  t = 120)
model




