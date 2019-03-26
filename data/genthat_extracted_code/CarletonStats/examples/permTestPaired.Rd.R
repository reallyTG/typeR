library(CarletonStats)


### Name: permTestPaired
### Title: Permutation test for paired data.
### Aliases: permTestPaired permTestPaired.default permTestPaired.formula
### Keywords: data paired permutation randomization resampling test

### ** Examples


#Does chocolate ice cream have more calories than vanilla ice cream, on average?
#H0: mean number of calories is the same
#HA: mean number of calories is greater in chocolate ice cream

permTestPaired(Icecream$VanillaCalories, Icecream$ChocCalories, alternative = "less")
permTestPaired(ChocCalories ~ VanillaCalories, data = Icecream, alternative = "greater")




