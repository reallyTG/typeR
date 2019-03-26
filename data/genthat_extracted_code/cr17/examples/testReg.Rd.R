library(cr17)


### Name: testReg
### Title: Regresion models difference testing
### Aliases: testReg

### ** Examples

fitR <- fitReg(time = LUAD$time, risk = LUAD$event, group = LUAD$gender, cens = "alive")
testReg(fitR)



