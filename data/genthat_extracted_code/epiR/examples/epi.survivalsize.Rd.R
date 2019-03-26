library(epiR)


### Name: epi.survivalsize
### Title: Sample size, power and minimum detectable hazard for time to
###   event studies
### Aliases: epi.survivalsize
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Therneau and Grambsch 2000 p. 63):
## The 5-year survival probability of patients receiving a standard treatment 
## is 0.30 and we anticipate that a new treatment will increase it to 0.45. 
## Assume that a study will use a two-sided test at the 0.05 level with 0.90
## power to detect this difference. How many events are required?

epi.survivalsize(treat = 0.45, control = 0.30, n = NA, power = 0.90, 
   r = 1, design = 1, sided.test = 2, conf.level = 0.95)

## A total of 250 events are required. Assuming one event per individual, 
## assign 125 individuals to the treatment group and 125 to the control group.


## EXAMPLE 2 (from Therneau and Grambsch 2000 p. 63):
## What is the minimum detectable hazard in a study involving 500 subjects where 
## the treatment to control ratio is 1:1, assuming a power of 0.90 and a
## 2-sided test at the 0.05 level?

epi.survivalsize(treat = NA, control = NA, n = 500, power = 0.90, 
   r = 1, design = 1, sided.test = 2, conf.level = 0.95)

## Assuming treatment increases time to event (compared with controls), the 
## minimum detectable hazard of a study involving 500 subjects (250 in the 
## treatment group and 250 in the controls) is 1.33.



