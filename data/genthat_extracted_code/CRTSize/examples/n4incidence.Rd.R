library(CRTSize)


### Name: n4incidence
### Title: Number of Subjects Required for a Cluster Randomized Trial
###   Comparing Incidence Rates
### Aliases: n4incidence print.n4incidence summary.n4incidence
### Keywords: design

### ** Examples

## Not run: 
##D Suppose a new drug is thought to reduce the incidence of HIV from 0.01 per person-year to 0.005
##D per person-year. Assume the coefficient of variation is 0.25 and that 1000 subjects will be 
##D followed for a two year period.  Calculate the required number of subjects that must be enrolled 
##D in a study to detect this difference with alpha = 0.05 and power = 0.80.
## End(Not run)
n4incidence(le=0.01, lc=0.005, m=1000, t=2, CV=0.25);



