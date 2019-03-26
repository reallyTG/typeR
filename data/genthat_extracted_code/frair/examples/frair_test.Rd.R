library(frair)


### Name: frair_test
### Title: Test for evidence of type-II or type-III functional responses
### Aliases: frair_test print.frtest

### ** Examples

data(gammarus)
frair_test(eaten~density, data=gammarus)

dat <- data.frame(x=1:100, y=floor(hassIII(1:100,b=0.01,c=0.001,h=0.03,T=1)))
frair_test(y~x, data=dat)



