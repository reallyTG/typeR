library(epiR)


### Name: epi.supb
### Title: Estimate the sample size for a parallel superiority trial,
###   binary outcomes
### Aliases: epi.supb
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Chow S, Shao J, Wang H 2008, p. 90):
## Suppose that a pharmaceutical company is interested in conducting a
## clinical trial to compare the efficacy of two antimicrobial agents 
## when administered orally once daily in the treatment of patients 
## with skin infections. In what follows, we consider the situation 
## where the intended trial is for testing superiority of the 
## test drug over the active control drug. For this purpose, the following 
## assumptions are made. First, sample size calculation will be performed 
## for achieving 80% power at the 5% level of significance.

## Assume the true mean cure rates of the treatment agents and the active 
## control are 85% and 65%, respectively. Assume the superiority
## margin is 5%.

epi.supb(treat = 0.85, control = 0.65, delta = 0.05, n = NA, 
   r = 1, power = 0.80, alpha = 0.05)

## A total of 196 subjects need to be enrolled in the trial, 98 in the 
## treatment group and 98 in the control group.




