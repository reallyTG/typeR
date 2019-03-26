library(epiR)


### Name: epi.cluster1size
### Title: Sample size under under one-stage cluster sampling
### Aliases: epi.cluster1size
### Keywords: univar

### ** Examples

## A survey to estimate the total number of residents over 65 years of 
## age that require the services of a nurse is to be carried out. There are 
## five housing complexes in the study area and we expect that there might
## be a total of around 34 residents meeting this criteria (variance 6.8).
## We would like the estimated sample size to provide us with an estimate
## that is within 10% of the true value. How many housing complexes (clusters)
## should be sampled?

epi.cluster1size(n = 5, mean = 34, var = 6.8, epsilon.r = 0.10, method = 
   "total", conf.level = 0.999)

## We would need to sample 3 housing complexes to meet the specifications 
## for this study.




