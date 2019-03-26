library(qrmix)


### Name: qrmix
### Title: Quantile Regression Classification
### Aliases: qrmix

### ** Examples

data(blood.pressure)

#qrmix model using default function values:
mod1 = qrmix(bmi ~ ., data = blood.pressure, k = 3)
summary(mod1)

#qrmix model using Bisquare loss function and refitted with robust regression:
mod2 = qrmix(bmi ~ age + systolic + diastolic + gender, data = blood.pressure, k = 3,
Ntau = 25, alpha = 0.1, lossFn = "Bisquare", fitMethod = "rlm")
summary(mod2)






