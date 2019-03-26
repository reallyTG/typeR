library(BSDA)


### Name: Press
### Title: Degree of confidence in the press versus education level for 20
###   randomly selected persons
### Aliases: Press
### Keywords: datasets

### ** Examples


plot(confidence ~ education_yrs, data = Press)
model <- lm(confidence ~ education_yrs, data = Press)
abline(model, col = "purple")
summary(model)
rm(model)




