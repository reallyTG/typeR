library(cr17)


### Name: testCuminc
### Title: K-sample Test for Competing Risks
### Aliases: testCuminc

### ** Examples

fitC <- fitCuminc(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive")
testCuminc(fitC)



