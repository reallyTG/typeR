library(mistr)


### Name: compdist
### Title: Creates an Object Representing Composite Distribution
### Aliases: compdist compdist.dist compdist.default

### ** Examples

# using the objects
C <- compdist(normdist(1, 3), expdist(4), weights = c(0.7, 0.3), breakpoints = 2)
C

# using the names and parameters
C2 <- compdist(c("norm","exp"), list(c(mean = 1, sd = 3), c(rate = 4)),
              weights = c(0.7, 0.3), breakpoints = 2)
C2

# more complicated model where break.spec is useful
C3 <- compdist(-GPDdist(1,0.15,0.7), normdist(-1,1), binomdist(5,0.5),
              geomdist(0.3) + 2, weights = c(0.075, 0.425, 0.425, 0.075),
              breakpoints = c(-2.5, 0,3), break.spec = c("L", "R", "R"))
C3

# same breakpoint twice
C4 <-  compdist(-expdist(2),poisdist(),expdist(2),
                weights = c(0.25, 0.5, 0.25), breakpoints = c(0, 0))
C4



