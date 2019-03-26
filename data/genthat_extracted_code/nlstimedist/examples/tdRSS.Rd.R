library(nlstimedist)


### Name: tdRSS
### Title: Calculate the corrected residual sum of squares
### Aliases: tdRSS

### ** Examples

tdTilia <- tdData(tilia, x = "Day", y = "Trees")
model <- timedist(data = tdTilia, x = "Day", y = "propMax", r = 0.1, c = 0.5,
                  t = 120)
model
tdRSS(model)




