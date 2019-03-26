library(ctmm)


### Name: summary.UD
### Title: Summarize a range distribution
### Aliases: summary.UD

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)

# Extract movement data for a single animal
Cilla <- buffalo$Cilla

# Fit a movement model
GUESS <- ctmm.guess(Cilla,interactive=FALSE)
FIT <- ctmm.fit(Cilla,GUESS)

# Estimate and summarize the AKDE
UD <- akde(Cilla,FIT)
summary(UD)
## End(No test)


