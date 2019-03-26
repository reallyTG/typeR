library(epiR)


### Name: epi.clustersize
### Title: Sample size for cluster-sample surveys
### Aliases: epi.clustersize
### Keywords: univar

### ** Examples

## EXAMPLE 1:
## The expected prevalence of disease in a population of cattle is 0.10.
## We wish to conduct a survey, sampling 50 animals per farm. No data  
## are available to provide an estimate of rho, though we suspect
## the intra-cluster correlation for this disease to be moderate.           
## We wish to be 95% certain of being within 10% of the true population
## prevalence of disease. How many herds should be sampled?

p <- 0.10; b <- 50; D <- 4
rho <- (D - 1) / (b - 1)
epi.clustersize(p = 0.10, b = 50, rho = rho, epsilon.r = 0.10, 
   conf.level = 0.95)

## We need to sample 278 herds (13900 samples in total).

## EXAMPLE 2 (from Bennett et al. 1991):
## A cross-sectional study is to be carried out to determine the prevalence
## of a given disease in a population using a two-stage cluster design. We 
## estimate prevalence to be 0.20 and we expect rho to be in the order of 0.02.
## We want to take sufficient samples to be 95% certain that our estimate of 
## prevalence is within 5% of the true population value (that is, a relative 
## error of 0.05 / 0.20 = 0.25). Assuming 20 responses from each cluster, 
## how many clusters do we need to be sample?

epi.clustersize(p = 0.20, b = 20, rho = 0.02, epsilon.r = 0.25, 
   conf.level = 0.95)

## We need to sample 18 clusters (360 samples in total).



