library(epiR)


### Name: epi.propsize
### Title: Sample size, power and minimum detectable risk ratio when
###   comparing proportions
### Aliases: epi.propsize
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Woodward 2005 pp. 403 - 404):
## A government initiative has decided to reduce the prevalence of male  
## smoking to, at most, 30%. A sample survey is planned to test, at the 
## 0.05 level, the hypothesis that the percentage of smokers in the male 
## population is 30% against the one-sided alternative that it is greater.
## The survey should be able to find a prevalence of 32%, when it is true,
## with 0.90 power. How many men need to be sampled?

epi.propsize(treat = 0.30, control = 0.32, n = NA, power = 0.90, 
   r = 1, design = 1, sided.test = 1, conf.level = 0.95)
   
## ## A total of 18,316 men should be sampled: 9158 in the treatment group and
## 9158 in the control group. The risk ratio (that is, the prevalence of 
## smoking in males post government initiative divided by the prevalence of 
## smoking in males pre inititative is 0.94.


## EXAMPLE 2:
## If we sample only 10,000 men (5000 in the treatment group and 5000 in the 
## control group) what is the maximum detectable risk ratio that is less 
## than 1?

epi.propsize(treat = NA, control = 0.32, n = 10000, power = 0.90, 
   r = 1, design = 1, sided.test = 1, conf.level = 0.95)

## If we sample only 10,000 men the maximum detectable risk ratio will be 0.91.




