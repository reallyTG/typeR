library(BSDA)


### Name: Victoria
### Title: Number of sunspots versus mean annual level of Lake Victoria
###   Nyanza from 1902 to 1921
### Aliases: Victoria
### Keywords: datasets

### ** Examples


plot(level ~ sunspot, data = Victoria)
model <- lm(level ~ sunspot, data = Victoria)
summary(model)
rm(model)




