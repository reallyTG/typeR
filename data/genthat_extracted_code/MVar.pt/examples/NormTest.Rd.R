library(MVar.pt)


### Name: NormTest
### Title: Teste de normalidade dos dados.
### Aliases: NormTest
### Keywords: Teste de normalidade dos dados. NormTest

### ** Examples

Data <- cbind(rnorm(100,2,3), rnorm(100,1,2))

NormTest(Data)

plot(density(Data))


Data <- cbind(rexp(200,3), rexp(200,3))

NormTest(Data, Sign = 0.01)

plot(density(Data))



