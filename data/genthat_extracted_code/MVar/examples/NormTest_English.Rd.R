library(MVar)


### Name: NormTest
### Title: Test of normality of the data.
### Aliases: NormTest
### Keywords: Test of normality of the data. NormTest

### ** Examples

Data <- cbind(rnorm(100,2,3), rnorm(100,1,2))

NormTest(Data)

plot(density(Data))


Data <- cbind(rexp(200,3), rexp(200,3))

NormTest(Data, Sign = 0.01)

plot(density(Data))



