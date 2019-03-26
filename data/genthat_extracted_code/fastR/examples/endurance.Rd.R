library(fastR)


### Name: endurance
### Title: Endurance and vitamin C
### Aliases: endurance
### Keywords: datasets

### ** Examples


data(endurance)
t.test(endurance$Vitamin, endurance$Placebo, paired=TRUE)
t.test(log(endurance$Vitamin), log(endurance$Placebo), paired=TRUE)
t.test(1/endurance$Vitamin, 1/endurance$Placebo, paired=TRUE)
xqqmath( ~ Vitamin - Placebo, data = endurance)
xqqmath( ~ log(Vitamin) - log(Placebo), data = endurance)
xqqmath( ~ 1/Vitamin - 1/Placebo, data = endurance)




