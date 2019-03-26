library(BSDA)


### Name: Iqgpa
### Title: GPA versus IQ for 12 individuals
### Aliases: Iqgpa
### Keywords: datasets

### ** Examples


plot(gpa ~ iq, data = Iqgpa, col = "blue", pch = 19)
model <- lm(gpa ~ iq, data = Iqgpa)
summary(model)
rm(model)




