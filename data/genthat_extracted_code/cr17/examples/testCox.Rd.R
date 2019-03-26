library(cr17)


### Name: testCox
### Title: Testing differences between groups in Cox models.
### Aliases: testCox

### ** Examples

fitC <- fitCox(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive")
testCox(fitC)



