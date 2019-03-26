library(epiR)


### Name: epi.betabuster
### Title: An R version of Wes Johnson and Chun-Lung Su's Betabuster
### Aliases: epi.betabuster
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## If a scientist is asked for their best guess for the diagnostic sensitivity
## of a particular test and the answer is 0.90, and if they are also willing 
## to assert that they are 80% certain that the sensitivity is greater than 
## 0.75, what are the shape1 and shape2 parameters for a beta distribution
## satisfying these constraints? 

rval <- epi.betabuster(mode = 0.90, conf = 0.80, greaterthan = TRUE, 
   x = 0.75, conf.level = 0.95, max.shape1 = 100, step = 0.001)
rval$shape1; rval$shape2

## The shape1 and shape2 parameters for the beta distribution that satisfy the
## constraints listed above are 9.875 and 1.986, respectively.

## This beta distribution reflects the probability distribution 
## obtained if there were 9 successes, r:
r <- rval$shape1 - 1; r

## from 10 trials, n:
n <- rval$shape2 + rval$shape1 - 2; n

dat <- data.frame(x = seq(from = 0, to = 1, by = 0.001), 
   y = dbeta(x = seq(from = 0, to = 1,by = 0.001), 
   shape1 = rval$shape1, shape2 = rval$shape2))

## Density plot of the estimated beta distribution:

## Not run: 
##D library(ggplot2)
##D 
##D windows(); ggplot(data = dat, aes(x = x, y = y)) +
##D    geom_line() + 
##D    xlab("Test sensitivity") +
##D    ylab("Density") 
## End(Not run)



