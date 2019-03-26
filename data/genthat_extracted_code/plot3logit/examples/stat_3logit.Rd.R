library(plot3logit)


### Name: stat_3logit
### Title: Add a field to a 'gg3logit' plot
### Aliases: stat_3logit

### ** Examples

data(cross_1year)

mod0 <- nnet::multinom(employment_sit ~ gender + finalgrade, data = cross_1year)
field0 <- field3logit(mod0, 'genderFemale')

gg3logit(field0) + stat_3logit()
gg3logit() + stat_3logit(data = field0)




