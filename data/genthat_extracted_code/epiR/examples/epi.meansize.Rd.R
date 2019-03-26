library(epiR)


### Name: epi.meansize
### Title: Sample size, power and minimum detectable difference when
###   comparing means
### Aliases: epi.meansize
### Keywords: univar

### ** Examples

## EXAMPLE 1 (from Woodward 2005 p. 399):
## Supposed we wish to test, at the 5% level of significance, the hypothesis
## that cholesterol means in a population are equal in two study years against 
## the one-sided alternative that the mean is higher in the second of the 
## two years. Suppose that equal sized samples will be taken in each year, 
## but that these will not necessarily be from the same individuals (i.e. the 
## two samples are drawn independently). Our test is to have a power of 0.95 
## at detecting a difference of 0.5 mmol/L. The standard deviation of serum 
## cholesterol in humans is assumed to be 1.4 mmol/L. 

epi.meansize(treat = 5, control = 4.5, n = NA, sigma = 1.4, power = 0.95, 
   r = 1, design = 1, sided.test = 1, conf.level = 0.95)

## To satisfy the study requirements 340 individuals need to be tested: 170 in
## the first year and 170 in the second year.


## EXAMPLE 2 (from Woodward 2005 pp. 399 - 400):
## Women taking oral contraceptives sometimes experience anaemia due to 
## impaired iron absorption. A study is planned to compare the use of iron
## tablets against a course of placebos. Oral contraceptive users are 
## randomly allocated to one of the two treatment groups and mean serum
## iron concentration compared after 6 months. Data from previous studies
## indicates that the standard deviation of the increase in iron
## concentration will be around 4 micrograms% over a 6-month period.
## The average increase in serum iron concentration without supplements is
## also thought to be 4 micrograms%. The investigators wish to be 90% sure
## of detecting when the supplement doubles the serum iron concentration using
## a two-sided 5% significance test. It is decided to allocate 4 times as many
## women to the treatment group so as to obtain a better idea of its effect.
## How many women should be enrolled in this study?

epi.meansize(treat = 8, control = 4, n = NA, sigma = 4, power = 0.90, 
   r = 4, design = 1, sided.test = 2, conf.level = 0.95)
   
## The estimated sample size is 70. We allocate 70/5 = 14 women to the 
## placebo group and four times as many (56) to the iron treatment group.




