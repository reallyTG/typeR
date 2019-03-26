library(epiR)


### Name: epi.supc
### Title: Estimate the sample size for a parallel superiority trial,
###   continuous outcomes
### Aliases: epi.supc
### Keywords: univar

### ** Examples

## EXAMPLE 1
## A pharmaceutical company is interested in conducting a clinical trial
## to compare two cholesterol lowering agents for treatment of patients with
## congestive heart disease (CHD) using a parallel design. The primary 
## efficacy parameter is the concentration of high density lipoproteins.
## (HDL). We consider the situation where the intended trial is to test 
## superiority of the test drug over the active control agent. Sample 
## size calculations are to be calculated to achieve 80% power at the
## 5% level of significance.

## In this example, we assume that if treatment results in a 5 unit 
## (i.e. delta = 5) increase in HDL it is declared to be superior to the
## active control. Assume the standard deviation of HDL is 10 units and 
## the HDL concentration in the treatment group is 20 units and the 
## HDL concentration in the control group is 20 units.

epi.supc(treat = 20, control = 20, sd = 10, delta = 5, n = NA, 
   r = 1, power = 0.80, alpha = 0.05)

## A total of 100 subjects need to be enrolled in the trial, 50 in the 
## treatment group and 50 in the control group.



