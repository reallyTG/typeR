library(ctmm)


### Name: summary.ctmm
### Title: Summarize a continuous-time movement model
### Aliases: summary.ctmm

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)

# Extract movement data for a single animal
Cilla <- buffalo$Cilla

# fit model
GUESS <- ctmm.guess(Cilla,interactive=FALSE)
FIT <- ctmm.fit(Cilla,GUESS)

# Tell us something interpretable
summary(FIT)
## End(No test)


