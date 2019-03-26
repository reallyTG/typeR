library(fastR2)


### Name: Endurance
### Title: Endurance and vitamin C
### Aliases: Endurance
### Keywords: datasets

### ** Examples


data(Endurance)
t.test(Endurance$vitamin, Endurance$placebo, paired = TRUE)
t.test(log(Endurance$vitamin), log(Endurance$placebo), paired = TRUE)
t.test(1/Endurance$vitamin, 1/Endurance$placebo, paired = TRUE)
gf_qq( ~ vitamin - placebo, data = Endurance)
gf_qq( ~ log(vitamin) - log(placebo), data = Endurance)
gf_qq( ~ 1/vitamin - 1/placebo, data = Endurance)




