library(BSDA)


### Name: Blackedu
### Title: Education level of blacks by gender
### Aliases: Blackedu
### Keywords: datasets

### ** Examples


T1 <- xtabs(~gender + education, data = Blackedu)
T1
chisq.test(T1)




