library(BSDA)


### Name: Oxytocin
### Title: Arterial blood pressure of 11 subjects before and after
###   receiving oxytocin
### Aliases: Oxytocin
### Keywords: datasets

### ** Examples


diff = Oxytocin$after - Oxytocin$before
qqnorm(diff)
qqline(diff)
shapiro.test(diff)
t.test(Oxytocin$after, Oxytocin$before, paired = TRUE)
rm(diff)




