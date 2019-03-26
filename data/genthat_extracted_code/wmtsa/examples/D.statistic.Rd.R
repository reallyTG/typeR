library(wmtsa)


### Name: D.statistic
### Title: D-statistic
### Aliases: D.statistic
### Keywords: univar

### ** Examples

## compare the D-statistic for a white noise 
## realization and a random walk. the random 
## walk D-statistic will be relatively large in 
## comparison to that of the white noise 
## realization, signifying a stronger departure 
## from an expected increase in cumulative 
## energy. 
D.statistic(rnorm(1024))
D.statistic(cumsum(rnorm(1024)))



