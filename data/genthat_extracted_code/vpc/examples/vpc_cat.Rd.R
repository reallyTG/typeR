library(vpc)


### Name: vpc_cat
### Title: VPC function for categorical
### Aliases: vpc_cat

### ** Examples


## See vpc.ronkeizer.com for more documentation and examples
library(vpc)

# simple function to simulate categorical data for single individual
sim_id <- function(id = 1) {
  n <- 10
  logit <- function(x) exp(x) / (1+exp(x))
  data.frame(id = id, time = seq(1, n, length.out = n),
             dv = round(logit((1:n) - n/2 + rnorm(n, 0, 1.5))) )
}
## simple function to simulate categorical data for a trial
sim_trial <- function(i = 1, n = 20) { # function to simulate categorical data for a trial
  data.frame(sim = i, do.call("rbind", lapply(1:n, sim_id)))
}

## simulate single trial for 20 individuals
obs <- sim_trial(n = 20)

## simulate 200 trials of 20 individuals
sim <- do.call("rbind", lapply(1:200, sim_trial, n = 20))

## Plot categorical VPC
vpc_cat(sim = sim, obs = obs)



