library(cr17)


### Name: plotSurvival
### Title: Survival curves
### Aliases: plotSurvival

### ** Examples

fitS <- fitSurvival(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive")
plotSurvival(fit = fitS, target = 1200)



