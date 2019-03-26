library(adehabitatLT)


### Name: redisltraj
### Title: Rediscretization of a Trajectory With Regular Step Length or
###   Duration
### Aliases: redisltraj
### Keywords: spatial

### ** Examples

#####################################
##
## Example of space rediscretization

data(puechcirc)

puechcirc

## before rediscretization
plot(puechcirc, perani = FALSE)

## after rediscretization
toto <- redisltraj(puechcirc, 100)
plot(toto, perani = FALSE)


#####################################
##
## Example of time rediscretization

data(buffalo)
tr <- buffalo$traj

## Show the time lag before rediscretization
plotltr(tr, "dt")

## Rediscretization every 1800 seconds
tr <- redisltraj(tr, 1800, type="time")

## Show the time lag after rediscretization
plotltr(tr, "dt")




