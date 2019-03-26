library(adehabitatLT)


### Name: lavielle
### Title: Segmentation of a time series using the method of Lavielle
###   (1999, 2005)
### Aliases: lavielle lavielle.default lavielle.ltraj print.lavielle
###   chooseseg findpath
### Keywords: cluster chron

### ** Examples


#################################################
##
## A simulated series

set.seed(129)
seri <- c(rnorm(100), rnorm(100, mean=2),
          rnorm(100), rnorm(100, mean=-3),
          rnorm(100), rnorm(100, mean=2))
plot(seri, ty="l", xlab="time", ylab="Series")

## Segmentation:
(l <- lavielle(seri, Lmin=10, Kmax=20))

## choose the number of segments
chooseseg(l)

## There is a clear break in the
## decrease of the contrast function after K = 6
## Moreover, Jk(6) >> 0.75 and Jk(7) << 0.75
## We choose 6 segments:
fp <- findpath(l, 6)
fp

## This list gives the limits of the segments
## for example, to get the first segment:
seg <- 1
firstseg <- seri[fp[[seg]][1]:fp[[seg]][2]]

####################################################
##
## Now, changes of variance

## A simulated series
set.seed(129)
seri <- c(rnorm(100), rnorm(100, sd=2),
          rnorm(100), rnorm(100, sd=3),
          rnorm(100), rnorm(100, sd=2))
plot(seri, ty="l", xlab="time", ylab="Series")

## Segmentation:
(l <- lavielle(seri, Lmin=10, Kmax=20, type="var"))

## choose the number of segments
chooseseg(l)

## There is a clear break in the
## decrease of the contrast function after K = 6
## Moreover, Jk(6) >> 0.75 and Jk(7) << 0.75
## We choose 6 segments:
fp <- findpath(l, 6)
fp

## This list gives the limits of the segments
## for example, to get the first segment:
seg <- 1
firstseg <- seri[fp[[seg]][1]:fp[[seg]][1]]

#################################################
##
## Example of segmentation of a trajectory

## Show the trajectory
data(porpoise)
gus <- porpoise[1]
plot(gus)

## Show the changes in the distance between
## successive relocations with the time
plotltr(gus, "dist")

## Segmentation of the trajectory based on these distances
lav <- lavielle(gus, Lmin=2, Kmax=20)

## Choose the number of segments
chooseseg(lav)
## 4 segments seem a good choice

## Show the partition
kk <- findpath(lav, 4)
plot(kk)




