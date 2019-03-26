library(BSDA)


### Name: Verbal
### Title: Verbal test scores and number of library books checked out for
###   15 eighth graders
### Aliases: Verbal
### Keywords: datasets

### ** Examples


plot(verbal ~ number, data = Verbal)
abline(lm(verbal ~ number, data = Verbal), col = "red")
summary(lm(verbal ~ number, data = Verbal))




