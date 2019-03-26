library(plot3logit)


### Name: TernaryField
### Title: Draw a field on an existing ternary plot
### Aliases: TernaryField

### ** Examples

library(nnet)
data(cross_1year)

mod0 <- nnet::multinom(employment_sit ~ gender + finalgrade, data = cross_1year)
field0 <- field3logit(mod0, 'genderFemale')

TernaryPlot()
TernaryField(field0)




