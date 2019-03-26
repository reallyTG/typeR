library(epiR)


### Name: epi.cohortsize
### Title: Sample size, power or minimum detectable risk ratio for a cohort
###   study
### Aliases: epi.cohortsize
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Woodward 2005 p. 406):
## A cohort study of smoking and coronary heart disease (CHD) in middle aged men
## is planned. A sample of men will be selected at random from the population
## and those that agree to participate will be asked to complete a 
## questionnaire. The follow-up period will be 5 years. The investigators would 
## like to be 0.90 sure of being able to detect when the risk ratio of CHD 
## is 1.4 for smokers, using a 0.05 significance test. Previous evidence 
## suggests that the incidence risk of death rate in non-smokers is 413 per 
## 100,000 per year. Assuming equal numbers of smokers and non-smokers are 
## sampled, how many men should be sampled overall?

e1 = 1.4 * (5 * 413)/100000; e0 = (5 * 413)/100000
epi.cohortsize(exposed = e1, unexposed = e0, n = NA, power = 0.90, 
   r = 1, design = 1, sided.test = 1, conf.level = 0.95)

## A total of 12,130 men need to be sampled (6065 smokers and 6065 non-smokers).


## EXAMPLE 2 (from Woodward 2005 p. 406):
## Say, for example, we are only able to enrol 5000 subjects into the study
## described above. What is the minimum and maximum detectable risk ratio?

e0 = (5 * 413)/100000
epi.cohortsize(exposed = NA, unexposed = e0, n = 5000, power = 0.90, 
   r = 1, design = 1, sided.test = 1, conf.level = 0.95)

## The minimum detectable risk ratio >1 is 1.65. The maximum detectable
## risk ratio <1 is 0.50.


## EXAMPLE 3:
## A study is to be carried out to assess the effect of a new treatment for
## anoestrus in dairy cattle. What is the required sample size if we expect 
## the proportion of cows responding in the treatment (exposed) group to be 
## 0.30 and the proportion of cows responding in the control (unexposed) group 
## to be 0.15? The required power for this study is 0.80 using a two-sided 
## 0.05 test.

epi.cohortsize(exposed = 0.30, unexposed = 0.15, n = NA, power = 0.80, 
   r = 1, design = 1, sided.test = 2, conf.level = 0.95)

## A total of 242 cows are required: 121 in the treatment (exposed) group and 
## 121 in the control (unexposed) group.

## Assume now that this study is going to be carried out using animals from a 
## number of herds. What is the required sample size when you account for the 
## observation that response to treatment is likely to cluster within herds. 

## For the exercise, assume that the intra-cluster correlation coefficient 
## (the rate of homogeneity, rho) for this treatment is 0.05 and the 
## average number of cows sampled per herd will be 30. 

## Calculate the design effect, given rho = (design - 1) / (nbar - 1), 
## where nbar equals the average number of individuals per cluster:

design <- 0.05 * (30 - 1) + 1
epi.cohortsize(exposed = 0.30, unexposed = 0.15, n = NA, power = 0.80, 
   r = 1, design = design, sided.test = 2, conf.level = 0.95)

## A total of 592 cows are required for this study: 296 in the treatment group
## and 296 in the control group.




