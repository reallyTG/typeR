library(epiR)


### Name: epi.prev
### Title: Estimate true prevalence
### Aliases: epi.prev
### Keywords: univar

### ** Examples

## A simple random sample of 150 cows from a herd of 2560 is taken.
## Each cow is given a screening test for brucellosis which has a 
## sensitivity of 96% and a specificity of 89%. Of the 150 cows tested
## 23 were positive to the screening test. What is the estimated prevalence 
## of brucellosis in this herd (and its 95% confidence interval)?

epi.prev(pos = 23, tested = 150, se = 0.96, sp = 0.89, method = "blaker",
   units = 100, conf.level = 0.95)

## The estimated true prevalence of brucellosis in this herd is 5.1 cases per 
## 100 cows (95% CI 0 -- 13 cases per 100 cows).

## Moujaber et al. (2008) analysed the seroepidemiology of Helicobacter pylori 
## infection in Australia. They reported seroprevalence rates together with 
## 95% confidence intervals by age group using the Clopper-Pearson exact 
## method (Clopper and Pearson, 1934). The ELISA test they applied had 96.4% 
## sensitivity and 92.7% specificity. A total of 151 subjects 1 -- 4 years
## of age were tested. Of this group 6 were positive. What is the estimated 
## true prevalence of Helicobacter pylori in this age group?

epi.prev(pos = 6, tested = 151, se = 0.964, sp = 0.927, method = "c-p",
   units = 100, conf.level = 0.95)

## The estimated true prevalence of Helicobacter pylori in 1 -- 4 year olds is
## 0 cases per 100 (95% 0 -- 1.3 cases per 100).

## Three dairy herds are tested for tuberculosis. On each herd a different test
## regime is used (each with a different diagnostic test sensitivity and 
## specificity). The number of animals tested in each herd were 210, 189 and 
## 124, respectively. The number of test-positives in each herd were 8, 12 
## and 7. Test sensitivities were 0.60, 0.65 and 0.70 (respectively). Test 
## specificities were 0.90, 0.95 and 0.99. What is the estimated true 
## prevalence of tuberculosis in the three herds?

rval <- epi.prev(pos = c(8,12,7), tested = c(210,189,124), 
   se = c(0.60,0.65,0.70), sp = c(0.90,0.95,0.99), method = "blaker", 
   units = 100, conf.level = 0.95)
round(rval$tp, digits = 3)

## True prevalence estimates for each herd:
## Herd 1: 0.00 (95% CI 0.00 to 2.05) cases per 100 cows.
## Herd 2: 2.25 (95% CI 0.00 to 9.45) cases per 100 cows.
## Herd 3: 6.73 (95% CI 0.99 to 9.00) cases per 100 cows.




