library(multipleNCC)


### Name: KMprob
### Title: Sampling probabilities estimated with a Kaplan-Meier type
###   formula
### Aliases: KMprob

### ** Examples

data(CVD_Accidents)
attach(CVD_Accidents)
KMprob(agestop,samplestat,m=1,agestart)
KMprob(agestop,samplestat,m=1,agestart,match.var=cbind(bmi),match.int=c(-2,2))

## The function is currently defined as
function (survtime, samplestat, m,  left.time = 0, match.var = 0, match.int = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    o = order(survtime)
    status = status[o]
    survtime = survtime[o]
    if (length(left.time) == n.cohort) {
        left.time = left.time[o]
    }
    if (length(match.var) == n.cohort) {
        match.var = match.var[o]
    }
    if (length(match.var) > n.cohort) {
        match.var = match.var[o, ]
    }
    tilbakestill = (1:n.cohort)[o]
    p = pKM(status, survtime, m, n.cohort, left.time, match.var, 
        match.int)
    p[status > 0] = 1
    p = p[order(tilbakestill)]
    p
  }



