library(Cprob)


### Name: cpf
### Title: Conditional Probability Function of a Competing Event
### Aliases: cpf [.cpf
### Keywords: survival

### ** Examples

data(mgus)

CP <- cpf(Hist(time, ev), data = mgus)
CP

## With age dichotomised according to its median
mgus$AGE <- ifelse(mgus$age < 64, 0, 1)
CP <- cpf(Hist(time, ev)~AGE, data = mgus)
CP
summary(CP)

## Conditional probability of the competing event
CP.death <- cpf(Hist(time, ev), data = mgus, failcode = 2)
CP.death



