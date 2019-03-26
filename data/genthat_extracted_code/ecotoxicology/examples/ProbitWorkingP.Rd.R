library(ecotoxicology)


### Name: ProbitWorkingP
### Title: Calculate working probit
### Aliases: ProbitWorkingP

### ** Examples

# Example from page 50 of Finney 1964:
# kill p = 72.3%, expected probit Y = 6.2
Y <- 6.2
p <- 72.3/100
# working probit = 5.366
ProbitWorkingP(Y,p)



