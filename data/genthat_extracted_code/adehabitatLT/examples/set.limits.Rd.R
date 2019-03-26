library(adehabitatLT)


### Name: set.limits
### Title: Define the Same Time Limits for several Bursts in a Regular
###   Trajectory
### Aliases: set.limits
### Keywords: programming

### ** Examples


## load data on the ibex
data(ibex)
ibex

## The monitoring of the 4 ibex should start and end at the same time
## define the time limits

ib2 <- set.limits(ibex, begin="2003-06-01 00:00", dur=14,
                  units="day", pattern="%Y-%m-%d %H:%M", tz="Europe/Paris")
ib2
is.sd(ib2)

## All the trajectories cover the same study period
## Relocations are collected at the same time. This dataset can now be
## used for studies of interactions between animals




