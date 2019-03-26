library(SenSrivastava)


### Name: E1.1
### Title: Data on density of vehicles and average speed
### Aliases: E1.1
### Keywords: datasets

### ** Examples

data(E1.1)
attach(E1.1)
plot(DENSITY, sqrt(SPEED))
E1.1.m1 <- lm(sqrt(SPEED) ~ DENSITY + I(DENSITY^2), data=E1.1)
summary(E1.1.m1)



