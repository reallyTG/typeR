library(secr)


### Name: usage
### Title: Detector Usage
### Aliases: usage usage<- effort
### Keywords: manip

### ** Examples

demo.traps <- make.grid(nx = 6, ny = 8)
## random usage over 5 occasions
usage(demo.traps) <- matrix (sample(0:1, 48*5, replace = TRUE, 
    p = c(0.5,0.5)), nc = 5)
usage(demo.traps)
summary(demo.traps)

usage(traps(ovenCH)) <- c(1,9,10,10,10,10)
## restore lost names
names(ovenCH) <- 2005:2009




