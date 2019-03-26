library(plot3logit)


### Name: plot3logit-package
### Title: Ternary Plots for Trinomial Regression Models
### Aliases: plot3logit-package

### ** Examples

data(cross_1year)

# Read from "nnet::multinom"
library(nnet)
mod0 <- multinom(employment_sit ~ gender + finalgrade, data = cross_1year)
field0 <- field3logit(mod0, 'genderFemale')
gg3logit(field0) + stat_3logit()

# Read from "MASS::polr"
library(MASS)
mydata <- cross_1year
mydata$finalgrade <- factor(mydata$finalgrade,
  c('Low', 'Average', 'High'), ordered = TRUE)
mod1 <- polr(finalgrade ~ gender + irregularity, data = mydata)
field1 <- field3logit(mod1, 'genderFemale')
gg3logit(field1) + stat_3logit()

# Read from "mlogit::mlogit"
library(mlogit)
mydata <- mlogit.data(cross_1year, choice = 'employment_sit', shape = 'wide')
mod2 <- mlogit(employment_sit ~ 0 | gender + finalgrade, data = mydata)
field2 <- field3logit(mod2, 'genderFemale')
gg3logit(field2) + stat_3logit()

# Read from matrix
M <- matrix(c(-2.05, 0.46, -2.46, 0.37), nrow = 2)
rownames(M) <- c('(Intercept)', 'genderFemale')
attr(M, 'labs') <- c('Employed', 'Unemployed', 'Trainee')
field3 <- field3logit(M, c(0, 1))
gg3logit(field3) + stat_3logit()




