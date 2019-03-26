library(qrmix)


### Name: summary.qrmix
### Title: Summarizing qrmix Fits
### Aliases: summary.qrmix

### ** Examples


data(blood.pressure)

#qrmix model using default function values:
mod1 = qrmix(bmi ~ ., data = blood.pressure, k = 3)

#summary using fitMethod = "rlm" instead of the one used when fitting the model mod1
summary1 = summary(mod1, fitMethod = "rlm")

#Are the quantiles selected in this case the same as in the original model?
summary1$quantiles
mod1$quantiles






