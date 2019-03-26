library(epiR)


### Name: epi.equivc
### Title: Estimate the sample size for a parallel equivalence trial,
###   continuous outcomes
### Aliases: epi.equivc
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Machin, Campbell, Tan and Tan 2009 p. 113):
## It is anticipated that patients on a particular drug have a mean diastolic 
## blood pressure of 96 mmHg, as against 94 mmHg on an alternative. It is also 
## anticipated that the standard deviation of diastolic BP is approximately 
## 8 mmHg. If one wishes to confirm that the difference is likely to be less 
## than 5 mmHg, that is, one wishes to show equivalence, how many patients 
## are need to be enrolled in the trial? Assume 80% power and 
## 95% significance.

epi.equivc(treat = 94, control = 96, sd = 8, delta = 5, n = NA, 
   r = 1, power = 0.80, alpha = 0.05)

## A total of 244 subjects need to be enrolled in the trial, 122 in the 
## treatment group and 122 in the control group.

## EXAMPLE 2 (from Chow S, Shao J, Wang H 2008, p. 64):
## A pharmaceutical company is interested in conducting a clinical trial
## to compare two cholesterol lowering agents for treatment of patients with
## congestive heart disease using a parallel design. The primary efficacy 
## parameter is the LDL. In what follows, we will consider the situation
## where the intended trial is for testing equivalence of mean responses 
## in LDL. Assume that 80% power is required at a 5% level of significance.

## In this example, we assume a 5 unit (i.e. delta = 5) change of LDL is 
## considered of clinically meaningful difference. Assume the standard 
## of LDL is 10 units and the LDL concentration in the treatment group is 20 
## units and the LDL concentration in the control group is 21 units.

epi.equivc(treat = 20, control = 21, sd = 10, delta = 5, n = NA, 
   r = 1, power = 0.80, alpha = 0.05)

## A total of 216 subjects need to be enrolled in the trial, 108 in the 
## treatment group and 108 in the control group.

## EXAMPLE 2 (cont.):
## Suppose only 150 subjects were enrolled in the trial, 75 in the treatment
## group and 75 in the control group. What is the estimated study power?

epi.equivc(treat = 0.20, control = 0.21, sd = 0.10, delta = 0.05, n = 150, 
   r = 1, power = NA, alpha = 0.05)

## With only 150 subjects the estimated study power is 0.58.



