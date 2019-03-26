library(ctmm)


### Name: akde
### Title: Calculate an autocorrelated kernel density estimate
### Aliases: akde akde.telemetry akde.list mean.UD

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)
Cilla <- buffalo$Cilla

GUESS <- ctmm.guess(Cilla,interactive=FALSE)
FIT <- ctmm.fit(Cilla,GUESS)

# Compute akde object
UD <- akde(Cilla,FIT)

# Plot data with AKDE contours
plot(Cilla,UD=UD)
## End(No test)


