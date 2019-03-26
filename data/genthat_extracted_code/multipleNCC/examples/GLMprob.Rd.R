library(multipleNCC)


### Name: GLMprob
### Title: Sampling probabilities estimated with logistic regression.
### Aliases: GLMprob

### ** Examples

data(CVD_Accidents)
attach(CVD_Accidents)
GLMprob(agestop,samplestat,agestart)
GLMprob(agestop,samplestat,agestart,match.var=cbind(sex,bmi),match.int=c(0,0,-2,2))

## The function is currently defined as
function (survtime, samplestat, left.time = 0, match.var = 0, 
    match.int = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    samplestat[samplestat > 1] = 1
    pglm = pGLM(status, survtime, samplestat, n.cohort, left.time, 
        match.var, match.int)
    p = rep(1, n.cohort)
    p[status == 0] = pglm
    p
  }



