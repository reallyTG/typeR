library(multipleNCC)


### Name: GAMprob
### Title: Sampling probabilities estimated with generalized additive
###   models.
### Aliases: GAMprob

### ** Examples

data(CVD_Accidents)
attach(CVD_Accidents)
GAMprob(agestop,samplestat,agestart)
GAMprob(agestop,samplestat,agestop,match.var=cbind(sex,bmi),match.int=c(0,0,-2,2))

## The function is currently defined as
function (survtime, samplestat, left.time = 0, match.var = 0, match.int = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    samplestat[samplestat > 1] = 1
    pgam = pGAM(status, survtime, samplestat, n.cohort, left.time)
    p = rep(1, n.cohort)
    p[status == 0] = pgam
    p
  }



