library(latticeExtra)


### Name: marginal.plot
### Title: Display marginal distributions
### Aliases: marginal.plot
### Keywords: hplot

### ** Examples

enviro <- environmental
## make an ordered factor (so it will not be reordered)
enviro$smell <- cut(enviro$ozone, breaks = c(0, 30, 50, Inf),
    labels = c("ok", "hmmm", "yuck"), ordered = TRUE)
marginal.plot(enviro)

## using groups
enviro$is.windy <- factor(enviro$wind > 10,
    levels = c(TRUE, FALSE), labels = c("windy", "calm"))
marginal.plot(enviro[,1:5], data = enviro, groups = is.windy,
    auto.key = list(lines = TRUE))

## support for tables
marginal.plot(Titanic)
## table with groups
marginal.plot(~ Titanic, data = Titanic, groups = Survived,
    type = "b", auto.key = list(title = "Survived?"))



