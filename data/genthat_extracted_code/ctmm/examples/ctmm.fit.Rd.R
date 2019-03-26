library(ctmm)


### Name: ctmm
### Title: Specify, fit, and select continuous-time movement models
### Aliases: ctmm ctmm.loglike ctmm.fit ctmm.select

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)
Cilla <- buffalo$Cilla

GUESS <- ctmm.guess(Cilla,interactive=FALSE)
FIT <- ctmm.fit(Cilla,GUESS)

# some human-readable information
summary(FIT)
## End(No test)


