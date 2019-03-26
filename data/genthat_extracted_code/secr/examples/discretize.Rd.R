library(secr)


### Name: discretize
### Title: Rasterize Area Search or Transect Data
### Aliases: discretize
### Keywords: manip

### ** Examples


## generate some polygon data
pol <- make.poly()
CH <- sim.capthist(pol, popn = list(D = 30), detectpar = list(g0 = 0.3))
plot(CH, border = 10, gridl = FALSE, varycol = FALSE)

## discretize and plot
CH1 <- discretize(CH, spacing = 10, output = 'count')
plot(CH1, add = TRUE, cappar = list(col = 'orange'), varycol =
    FALSE, rad = 0)
plot(traps(CH1), add = TRUE)
# overlay cell boundaries
plot(as.mask(traps(CH1)), dots = FALSE, col = NA, meshcol = 'green', 
    add = TRUE)

## show how detections are snapped to new detectors
newxy <- traps(CH1)[nearesttrap(xy(CH),traps(CH1)),]
segments(xy(CH)[,1], xy(CH)[,2], newxy[,1], newxy[,2])

plot(traps(CH), add = TRUE)  # original polygon




