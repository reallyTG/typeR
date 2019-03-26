library(BSDA)


### Name: Ability
### Title: Perceived math ability for 13-year olds by gender
### Aliases: Ability
### Keywords: datasets

### ** Examples


CT <- xtabs(~gender + ability, data = Ability)
CT
chisq.test(CT)




