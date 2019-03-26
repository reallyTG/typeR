library(cr17)


### Name: simpleCox
### Title: Cox model for each type of event separately
### Aliases: simpleCox fitCox

### ** Examples

fitCox(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive", conf.int = 0.95)



