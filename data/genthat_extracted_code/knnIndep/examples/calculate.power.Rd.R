library(knnIndep)


### Name: calculate.power
### Title: Calculate power at a given significance level
### Aliases: calculate.power

### ** Examples

mycor = function(...) cor(...)^2
vals = run.tests(mycor,list(),1:2,cbind(c(.3,.4,6),c(.3,.5,4)),100)
drop(calculate.power(vals))



