library(vpc)


### Name: vpc_cens
### Title: VPC function for left- or right-censored data (e.g. BLOQ data)
### Aliases: vpc_cens

### ** Examples


## See vpc.ronkeizer.com for more documentation and examples
library(vpc)

vpc_cens(sim = simple_data$sim, obs = simple_data$obs, lloq = 30)
vpc_cens(sim = simple_data$sim, obs = simple_data$obs, uloq = 120)




