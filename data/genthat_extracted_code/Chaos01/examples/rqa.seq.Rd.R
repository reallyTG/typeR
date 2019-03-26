library(Chaos01)


### Name: rqa.seq
### Title: Function to compute diagonal RQA measures for given time series
###   and sequence of thresholds.
### Aliases: rqa.seq
### Keywords: determinism, rqa test,

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

x.range <- diff(range(vec.x))

from = 0.01 * x.range
by   = 0.1 * x.range

#Output for each value of eps
res <- rqa.seq(vec.x, from = from, to = x.range, by = by, TS = vec.x, dim = 3, lag = 10)

## Not run: 
##D #It is a good idea to get a grasp on how RQA develop for different colored noise.
##D if(requireNamespace(tuneR)){
##D pink  <- tuneR::noise(kind = "pink", duration = 1000)@left
##D red   <- tuneR::noise(kind = "red", duration = 1000)@left
##D power <- tuneR::noise(kind = "power", duration = 1000)@left
##D white <- tuneR::noise(kind = "white", duration = 1000)@left
##D 
##D start <- 0.001 * diff(range(TS))
##D end   <- 1.0   * diff(range(TS))
##D step  <- 0.01  * diff(range(TS))
##D 
##D rqa.pink  <- Chaos01::rqa.seq(start, end, step, pink, dim, lag, theta, lmin)
##D rqa.red   <- Chaos01::rqa.seq(start, end, step, red, dim, lag, theta, lmin)
##D rqa.power <- Chaos01::rqa.seq(start, end, step, power, dim, lag, theta, lmin)
##D rqa.white <- Chaos01::rqa.seq(start, end, step, white, dim, lag, theta, lmin)
##D 
##D plotvar <- c("RR", "RATIO", "DET", "LAM", "AVG", "TT", "MAX", "MAX_V")
##D 
##D par(mfrow = c(4,2))
##D plot(rqa.pink, plotvar)
##D plot(rqa.red, plotvar)
##D plot(rqa.power, plotvar)
##D plot(rqa.white, plotvar)
##D }
## End(Not run)



