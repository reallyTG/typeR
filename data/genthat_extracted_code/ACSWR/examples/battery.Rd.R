library(ACSWR)


### Name: battery
### Title: Two Factorial Experiment for Battery Data
### Aliases: battery
### Keywords: factorial experiment

### ** Examples

data(battery)
names(battery) <- c("L","M","T")
battery$M <- as.factor(battery$M)
battery$T <- as.factor(battery$T)
battery.aov <- aov(L~M*T,data=battery)
model.matrix(battery.aov)
summary(battery.aov)



