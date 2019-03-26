library(scuba)


### Name: whichtank
### Title: Which Tanks are Used during a Dive
### Aliases: whichtank whichtank<-
### Keywords: utilities

### ** Examples

   # tanks are numbered
   d <- dive(air, c(30,40), 6, nitrox(0.5), c(6,3), c(3,3))
   d
   tanklist(d)
   whichtank(d)
   # change choice of tank at 6 metre deco stop
   # The Hard Way:
   whichtank(d) <- c(1,1,1,1,1,2,2,2)
   d

   # The Snazzy Way:
   # if shallower than 3 metres, then tank 2, else tank 1
   whichtank(d) <- ifelse(depths.dive(d) <= 3, 2, 1)
   d

   # tanks with names
   dd <- dive(tanklist=list(travel=trimix(0.18, 0.5), deco=nitrox(0.8)),
             tank="travel", c(30,40), c(20, 10), 9, tank="deco",
             c(9,10), c(6,5), c(3,5))
   dd
   # if shallower than 6 metres, then deco gas, else travel gas
   whichtank(dd) <- ifelse(depths.dive(dd) <= 6, "deco", "travel")
   dd



