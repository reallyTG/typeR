library(cr17)


### Name: summarizeCR
### Title: Competing Risks Models Summary
### Aliases: summarizeCR

### ** Examples

summarizeCR(time = LUAD$time/365, risk = LUAD$event, group = LUAD$gender, cens = "alive")

summarizeCR(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive",
target = 1200, type = "fleming-harrington",  conf.int = 0.99, conf.type = "log-log",
ggtheme = theme_bw())

summarizeCR(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive", rho = 1,
target = 800, type = "kaplan-meier", ggtheme = theme_gray(), titleSurv = "Survival analysis",
titleCuminc = "Competing risks models", xtitle = "Days", ytitleSurv = "Survival curves",
ytitleCuminc = "Cumulative incidence functions", legendtitle = "Gender")




