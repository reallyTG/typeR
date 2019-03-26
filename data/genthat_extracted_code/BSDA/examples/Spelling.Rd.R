library(BSDA)


### Name: Spelling
### Title: Spelling scores for 9 eighth graders before and after a 2-week
###   course of instruction
### Aliases: Spelling
### Keywords: datasets

### ** Examples


qqnorm(Spelling$differ)
qqline(Spelling$differ)
shapiro.test(Spelling$differ)
t.test(Spelling$before, Spelling$after, paired = TRUE)
t.test(Spelling$differ)




