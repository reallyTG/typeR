library(QuantPsyc)


### Name: sim.slopes
### Title: Moderated Simple Slopes
### Aliases: sim.slopes
### Keywords: models

### ** Examples


data(tra)
lm.mod1 <- moderate.lm(beliefs, values, attitudes, tra)
ss.mod1 <- sim.slopes(lm.mod1, tra$values)
ss.mod1




