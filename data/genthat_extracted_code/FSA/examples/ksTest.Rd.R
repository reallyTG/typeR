library(FSA)


### Name: ksTest
### Title: Kolmogorov-Smirnov Tests.
### Aliases: ksTest ksTest.default ksTest.formula
### Keywords: htest

### ** Examples

## see ks.test for other examples
x <- rnorm(50)
y <- runif(30)
df <- data.frame(dat=c(x,y),grp=rep(c("X","Y"),c(50,30)))

## one-sample (from ks.test) still works
ksTest(x+2, "pgamma", 3, 2)
ks.test(x+2, "pgamma", 3, 2)

## first two-sample example in ?ks.test
ksTest(x,y)
ks.test(x,y)

## same as above but using data.frame and formula
ksTest(dat~grp,data=df)




