library(BSDA)


### Name: Jobsat
### Title: Job satisfaction and stress level for 9 school teachers
### Aliases: Jobsat
### Keywords: datasets

### ** Examples


plot(satisfaction ~ wspt, data = Jobsat)
model <- lm(satisfaction ~ wspt, data = Jobsat)
abline(model, col = "blue")
summary(model)
rm(model)




