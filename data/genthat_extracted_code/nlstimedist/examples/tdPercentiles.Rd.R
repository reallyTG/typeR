library(nlstimedist)


### Name: tdPercentiles
### Title: Calculate percentiles
### Aliases: tdPercentiles

### ** Examples

tdTilia <- tdData(tilia, x = "Day", y = "Trees")
model <- timedist(data = tdTilia, x = "Day", y = "propMax", r = 0.1, c = 0.5,
                  t = 120)
model
tdPercentiles(model, n = 0.5)
tdPercentiles(model, n = seq(0, 0.9, 0.1))




