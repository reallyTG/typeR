library(cycleRtools)


### Name: mmv
### Title: Maximal mean values.
### Aliases: mmv

### ** Examples

data(ridedata)

## Best power for 5 and 20 minutes.
tsec <- c(5, 20) * 60
mmv(ridedata, power.W, tsec)

## Generate a simple critical power estimate.
tsec <- 2:20 * 60
pwrs <- mmv(ridedata, power.W, tsec)
m <- lm(pwrs[1, ] ~ {1 / tsec})  # Simple inverse model.
coef(m)[1]  # Intercept = critical power.

## More complex models...
m <- Pt_model(pwrs[1, ], tsec)
print(m)
## Extract the asymptote of the exponential model.
coef(m)$exp["CP"]




