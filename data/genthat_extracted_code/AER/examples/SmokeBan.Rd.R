library(AER)


### Name: SmokeBan
### Title: Do Workplace Smoking Bans Reduce Smoking?
### Aliases: SmokeBan
### Keywords: datasets

### ** Examples

data("SmokeBan")

## proportion of non-smokers increases with education
plot(smoker ~ education, data = SmokeBan)

## proportion of non-smokers constant over age
plot(smoker ~ age, data = SmokeBan)



