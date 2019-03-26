library(cr17)


### Name: plotCuminc
### Title: Cumulative incidences curves
### Aliases: plotCuminc

### ** Examples

fitC <- fitCuminc(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive")
plotCuminc(ci = fitC, cens = "alive", target = 1200)



