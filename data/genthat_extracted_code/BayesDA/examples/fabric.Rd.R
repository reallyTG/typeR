library(BayesDA)


### Name: fabric
### Title: Numbers of Faults Found in Each of 32 Rolls of Fabric
### Aliases: fabric
### Keywords: datasets

### ** Examples

data(fabric)
str(fabric)
names(fabric)
# Identity link:
with(fabric, plot(faults ~ length))
# log link:
with(fabric, plot(faults ~ length, log="y"))
# Fitting poisson regression models:
mod1 <- glm(faults ~ length-1, data=fabric, family=poisson)
OK <- require(MCMCpack)
if(OK) mod2 <- MCMCpoisson(faults ~ length-1, data=fabric, b0=0, B0=0.0001)
summary(mod1)
confint(mod1)
if(OK) summary(mod2)
# The exercise is to investigate overdispersion ...



