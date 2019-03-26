library(wec)


### Name: BMI
### Title: Data on BMI of Dutch citizens
### Aliases: BMI
### Keywords: datasets

### ** Examples


data(BMI)

# Without Controls
model.dummy <- lm(BMI ~ education, data=BMI)
summary(model.dummy)

# With Controls
model.dummy.controls <- lm(BMI ~ education + sex + log_age + childless + year, data=BMI)
summary(model.dummy.controls)




