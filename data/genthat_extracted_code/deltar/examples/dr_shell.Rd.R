library(deltar)


### Name: dr_shell
### Title: Delta R from the radiocarbon date of the marine material with
###   known collection date
### Aliases: dr_shell

### ** Examples

## Calculation of Delta R for Pseudocardium sybillae shell
## collected in Sakhalin in 1906 and radiocarbon dated
## 826 ± 35 years BP, laboratory code TERRA-072305a15
## (data from Yoneda et al., 2007, table 2)

# Compute and store the results in the new object
Ps <- dr_shell(c(1906, 826, 35), name = "TERRA-072305a15")
# Mean value of Delta R
Ps$mean
# Median value of Delta R
Ps$median
# Standard deviation of Delta R
Ps$sd
# An interval containing true Delta R value with probability 0.95
Ps$quantile
# p value of Kolomogorov - Smirnov test
Ps$p.value



