library(mosaic)


### Name: FunctionsFromData
### Title: Create function from data
### Aliases: FunctionsFromData spliner smoother linearModel connector

### ** Examples

if (require(mosaicData)) {
data(CPS85)
f <- smoother(wage ~ age, span=.9, data=CPS85)
f(40)
g <- linearModel(log(wage) ~ age + educ + 1, data=CPS85)
g(age=40, educ=12)
# an alternative way to define g (Note: + 1 is the default for lm().)
g2 <- makeFun(lm(log(wage) ~ age + educ, data=CPS85))
g2(age=40, educ=12)
x<-1:5; y=c(1, 2, 4, 8, 8.2)
f1 <- spliner(y ~ x)
f1(x=8:10)
f2 <- connector(x~y)
}



