library(BSDA)


### Name: Blood
### Title: Blood pressure of 15 adult males taken by machine and by an
###   expert
### Aliases: Blood
### Keywords: datasets

### ** Examples


DIFF <- Blood$machine - Blood$expert
shapiro.test(DIFF)
qqnorm(DIFF)
qqline(DIFF)
rm(DIFF)
t.test(Blood$machine, Blood$expert, paired = TRUE)




