library(ROCit)


### Name: getsurvival
### Title: Survival Probability
### Aliases: getsurvival

### ** Examples

data("Loan")
k <- density(Loan$Income)
# What portion have income over 100,000
getsurvival(k,100000)





