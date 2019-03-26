library(epiR)


### Name: epi.detectsize
### Title: Sample size to detect disease
### Aliases: epi.detectsize
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## We would like to confirm the absence of disease in a single 1000-cow 
## dairy herd. We expect the prevalence of disease in the herd to be 5%.
## We intend to use a single test with a sensitivity of 0.90 and a 
## specificity of 0.80. How many samples should we take to be 95% certain 
## that, if all tests are negative, the disease is not present?

epi.detectsize(N = 1000, prev = 0.05, se = 0.90, sp = 0.80, interpretation =
   "series", covar = c(0,0), conf.level = 0.95, finite.correction = TRUE)

## We need to sample 59 cows.

## EXAMPLE 2:
## We would like to confirm the absence of disease in a study area. If the 
## disease is present we expect the between-herd prevalence to be 8% and the 
## within-herd prevalence to be 5%. We intend to use two tests: the first has 
## a sensitivity and specificity of 0.90 and 0.80, respectively. The second 
## has a sensitivity and specificity of 0.95 and 0.85, respectively. The two 
## tests will be interpreted in parallel. How many herds and cows within herds 
## should we sample to be 95% certain that the disease is not present in the 
## study area if all tests are negative? There area is comprised of 
## approximately 5000 herds and the average number of cows per herd is 100.

epi.detectsize(N = c(5000, 100), prev = c(0.08, 0.05), se = c(0.90, 0.95), 
   sp = c(0.80, 0.85), interpretation = "parallel", covar = c(0,0), 
   conf.level = 0.95, finite.correction = TRUE)

## We need to sample 31 cows from 38 herds (a total of 1178 samples).
## The sensitivity of this testing regime is 99%. The specificity of this 
## testing regime is 68%.

## EXAMPLE 3:
## You want to document the absence of Mycoplasma from a 200-sow pig herd.
## Based on your experience and the literature, a minimum of 20% of sows  
## would have seroconverted if Mycoplasma were present in the herd. How many 
## sows do you need to sample?

epi.detectsize(N = 200, prev = 0.20, se = 1.00, sp = 1.00, conf.level = 0.95,
   finite.correction = TRUE)

## If you test 12 sows and all test negative you can state that you are 95% 
## confident that the prevalence rate of Mycoplasma in the herd is less than
## 20%.




