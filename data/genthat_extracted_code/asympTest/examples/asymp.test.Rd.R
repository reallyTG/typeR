library(asympTest)


### Name: asymp.test
### Title: Asymptotic tests
### Aliases: asymp.test asymp.test.default asymp.test.formula
### Keywords: htest univar

### ** Examples

## one sample
x <- rnorm(70, mean = 1, sd = 2)
asymp.test(x)
asymp.test(x,par="mean",alt="g")
asymp.test(x,par="mean",alt="l",ref=2)
asymp.test(x,par="var",alt="g")
asymp.test(x,par="var",alt="l",ref=2)
## two samples
y <- rnorm(50, mean = 2, sd = 1)
asymp.test(x,y)
asymp.test(x,y,"rMean","l",.75)
asymp.test(x,y,"dMean","l",0,rho=.75)
asymp.test(x,y,"dVar")
## Formula interface
asymp.test(uptake~Type,data=CO2)



