library(epiR)


### Name: epi.equivb
### Title: Estimate the sample size for a parallel equivalence trial,
###   binary outcomes
### Aliases: epi.equivb
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Machin, Campbell, Tan and Tan 2009 p. 113):
## Bennett, Dismukes, Duma et al. (1979) designed a clinical trial to test 
## whether combination chemotherapy for a shorter period would be at least 
## as good as conventional therapy for patients with cryptococcal meningitis. 
## They recruited 39 patients to each treatment arm and wished to conclude 
## that a difference of less than 20% in response rate between the treatments
## would indicate equivalence. Assuming a one-sided test size of 10%, a 
## power of 80% and an overall response rate of 50%, what would be a 
## realistic sample size if the trial were to be repeated?

epi.equivb(treat = 0.50, control = 0.50, delta = 0.20, n = NA, r = 1, 
   power = 0.80, alpha = 0.10)

## A total of 166 subjects need to be enrolled in the trial, 83 in the 
## treatment group and 83 in the control group.



