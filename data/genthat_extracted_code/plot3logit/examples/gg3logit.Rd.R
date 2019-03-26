library(plot3logit)


### Name: gg3logit
### Title: Create a new gg3logit
### Aliases: gg3logit

### ** Examples

data(cross_1year)

mod0 <- nnet::multinom(employment_sit ~ gender + finalgrade, data = cross_1year)
field0 <- field3logit(mod0, 'genderFemale')

gg3logit(field0) + stat_3logit()




