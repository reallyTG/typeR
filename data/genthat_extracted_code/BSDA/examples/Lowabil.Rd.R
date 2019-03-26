library(BSDA)


### Name: Lowabil
### Title: Reading skills of 24 matched low ability students
### Aliases: Lowabil
### Keywords: datasets

### ** Examples


diff = Lowabil$experiment - Lowabil$control
qqnorm(diff)
qqline(diff)
shapiro.test(diff)
t.test(Lowabil$experiment, Lowabil$control, paired = TRUE)
# OR
t.test(diff)
rm(diff)




