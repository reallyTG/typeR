library(rr)


### Name: rrreg
### Title: Randomized Response Regression
### Aliases: rrreg
### Keywords: regression

### ** Examples


data(nigeria)

set.seed(1)

## Define design parameters
p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

## Fit linear regression on the randomized response item of whether 
## citizen respondents had direct social contacts to armed groups

rr.q1.reg.obj <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                    I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
                    data = nigeria, p = p, p1 = p1, p0 = p0, 
                    design = "forced-known")
  
summary(rr.q1.reg.obj)

## Replicates Table 3 in Blair, Imai, and Zhou (2014)




