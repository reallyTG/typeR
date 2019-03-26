library(cr17)


### Name: fitSurvival
### Title: Estimation of survival curves for each risk separately
### Aliases: fitSurvival

### ** Examples

fitSurvival(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive",
type = "kaplan-meier", conf.int = 0.95, conf.type = "log")



