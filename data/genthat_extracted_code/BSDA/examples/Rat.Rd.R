library(BSDA)


### Name: Rat
### Title: Survival times of 20 rats exposed to high levels of radiation
### Aliases: Rat
### Keywords: datasets

### ** Examples


hist(Rat$survival_time)
qqnorm(Rat$survival_time)
qqline(Rat$survival_time)
summary(Rat$survival_time)
t.test(Rat$survival_time)
t.test(Rat$survival_time, mu = 100, alternative = "greater")




