library(vpc)


### Name: add_noise
### Title: Add noise / residual error to data
### Aliases: add_noise

### ** Examples

library(dplyr)
ipred <- c(10, 8, 6, 4, 2, 0) %>% add_noise(ruv = list(proportional = 0.1, additive = 0.2))



