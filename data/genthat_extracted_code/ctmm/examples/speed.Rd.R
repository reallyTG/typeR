library(ctmm)


### Name: speed
### Title: Estimate the average speed of a tracked animal
### Aliases: speed speed.ctmm speed.telemetry speeds speeds.ctmm
###   speeds.telemetry

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)
Gabs <- buffalo$Gabs

GUESS <- ctmm.guess(Gabs,interactive=FALSE)
FIT <- ctmm.fit(Gabs,GUESS)

# stationary Gaussian estimate
speed(FIT)

# conditional estimate
speed(FIT,Gabs)
## End(No test)


