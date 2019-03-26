library(epiR)


### Name: epi.noninfc
### Title: Estimate the sample size for a parallel equivalence trial,
###   continuous outcomes
### Aliases: epi.noninfc
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Chow S, Shao J, Wang H 2008, p. 64):
## A pharmaceutical company is interested in conducting a clinical trial
## to compare two cholesterol lowering agents for treatment of patients with
## congestive hear disease using a parallel design. The primary efficacy 
## parameter is the LDL. In what follows, we will consider the situation
## where the intended trial is for testing non-inferiority of mean responses 
## in LDL. Assume that 80% power is required at a 5% level of significance.

## In this example, we assume a 5% (i.e. delta = 0.05) change of LDL is 
## considered of clinically meaningful difference. Assume the standard 
## of LDL is 0.10 and the LDL concentration in the treatment group is 0.20 
## units and the LDL concentration in the control group is 0.20 units.

epi.noninfc(treat = 0.20, control = 0.20, sd = 0.10, delta = 0.05, n = NA, 
   r = 1, power = 0.80, alpha = 0.05)

## A total of 100 subjects need to be enrolled in the trial, 50 in the 
## treatment group and 50 in the control group.



