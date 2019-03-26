library(dmutate)


### Name: mutate_random
### Title: Add random variates to a data frame.
### Aliases: mutate_random mutate_random,data.frame,formula-method
###   mutate_random,data.frame,character-method
###   mutate_random,data.frame,list-method
###   mutate_random,data.frame,covset-method
###   mutate_random,data.frame,covobj-method

### ** Examples


data <- data.frame(ID=1:10, GROUP = sample(c(1,2,3),10,replace=TRUE))

mutate_random(data, AGE[40,90] ~ rnorm(55,50))
mutate_random(data, RE ~ rbeta(1,1) | GROUP)

e <- list(lower=40,upper=140,mu=100,sd=100)

egfr <- covset(EGFR[lower,upper] ~ rnorm(mu,sd))

mutate_random(data,egfr,envir=e)




