library(ctmm)


### Name: occurrence
### Title: Calculate a Kriged occurrence disribution estimate
### Aliases: occurrence

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)
Cilla <- buffalo$Cilla

GUESS <- ctmm.guess(Cilla,interactive=FALSE)
FIT <- ctmm.fit(Cilla,GUESS)

# Compute occurence distribution
UD <- occurrence(Cilla,FIT)

# Plot occurrence UD
plot(UD,col.level=NA)
## End(No test)


