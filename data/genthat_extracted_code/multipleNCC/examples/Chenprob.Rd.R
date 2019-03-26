library(multipleNCC)


### Name: Chenprob
### Title: Sampling probabilities estimated with local averaging.
### Aliases: Chenprob

### ** Examples
   

data(CVD_Accidents)
attach(CVD_Accidents)
Chenprob(agestop,samplestat,left.time=agestart)
Chenprob(agestop,samplestat,left.time=agestart,no.intervals.left=c(3,4))

function (survtime, samplestat, no.intervals, left.time = 0, no.intervals.left = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    samplestat[samplestat > 1] = 1
    ind.no = 1:length(samplestat)
    p = pChen(status, survtime, samplestat, ind.no, n.cohort, 
        no.intervals, left.time, no.intervals.left)
    p[status == 1] = 1
    p
  }



