library(SK)


### Name: bxcxt
### Title: Boxcox transform for a response variable
### Aliases: bxcxt

### ** Examples

vehicles_obs <- vehicles[vehicles@data$obs1pred0 == 1,]
vehicles_obs$transheavy <- bxcxt(vehicles_obs$heavy, vehicles_obs$width)[[1]]
qqnorm(vehicles_obs$heavy)
qqnorm(vehicles_obs$transheavy)
lambda <- bxcxt(vehicles_obs$heavy, vehicles_obs$width)[[2]]



