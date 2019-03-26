library(qrmix)


### Name: plot.qrmix
### Title: Plot Method for a qrmix Object
### Aliases: plot.qrmix

### ** Examples


data(blood.pressure)

#qrmix model using default function values:
mod1 = qrmix(bmi ~ ., data = blood.pressure, k = 3)
plot(mod1)
plot(mod1, type = c(1,3), lwd = 1)




