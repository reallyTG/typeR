library(epiR)


### Name: epi.stratasize
### Title: Sample size under under stratified random sampling
### Aliases: epi.stratasize
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## Hospital episodes (Levy and Lemeshow 1999, page 176 -- 178)
## We plan to take a sample of the members of a health maintenance 
## organisation (HMO) for purposes of estimating the average number
## of hospital episodes per person per year. The sample will be selected
## from membership lists according to age (under 45 years, 45 -- 64 years, 
## 65 years and over). The number of members in each strata are 600, 500,
## and 400 (respectively). Previous data estimates the mean number of 
## hospital episodes per year for each strata as 0.164, 0.166, and 0.236
## (respectively). The variance of these estimates are 0.245, 0.296, and 
## 0.436 (respectively). How many from each strata should be sampled to be
## 95% that the sample estimate of hospital episodes is within 20% of the 
## true value?

strata.n <- c(600, 500, 400)
strata.mean <- c(0.164, 0.166, 0.236)
strata.var <- c(0.245, 0.296, 0.436)
epi.stratasize(strata.n, strata.mean, strata.var, strata.Py, 
   epsilon.r = 0.20, method = "mean", conf.level = 0.95)

## The number allocated to the under 45 years, 45 -- 64 years, and 65 years 
## and over stratums should be 223, 186, and 149 (a total of 558). These 
## results differ from the worked example provided in Levy and Lemeshow where 
## certainty is set to approximately 99%.

## EXAMPLE 2:
## Dairies are to be sampled to determine the proportion of herd managers 
## using foot bathes. Herds are stratified according to size (small, medium, 
## and large). The number of herds in each strata are 1500, 2500, and 4000
## (respectively). A review of the literature indicates that use of foot bathes
## on farms is in the order of 0.50, with the probability of usage increasing
## as herds get larger. How many dairies should be sampled?

strata.n <- c(1500, 2500, 4000)
strata.Py <- c(0.50, 0.60, 0.70)
epi.stratasize(strata.n, strata.mean, strata.var, strata.Py, 
   epsilon.r = 0.20, method = "proportion", conf.level = 0.95)

## A total of 54 herds should be sampled: 10 small, 17 medium, and 27 large.





