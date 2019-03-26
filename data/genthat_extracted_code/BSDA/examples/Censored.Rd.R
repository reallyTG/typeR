library(BSDA)


### Name: Censored
### Title: Entry age and survival time of patients with small cell lung
###   cancer under two different treatments
### Aliases: Censored
### Keywords: datasets

### ** Examples


boxplot(survival ~ treatment, data = Censored, col = "yellow")
wilcox.test(survival ~ treatment, data = Censored, alternative = "greater")




