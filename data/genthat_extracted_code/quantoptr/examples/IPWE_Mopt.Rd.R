library(quantoptr)


### Name: IPWE_Mopt
### Title: Estimate the Mean-optimal Treatment Regime
### Aliases: IPWE_Mopt

### ** Examples

GenerateData.test.IPWE_Mopt <- function(n)
{
  x1 <- runif(n)
  x2 <- runif(n)
  tp <- exp(-1+1*(x1+x2))/(1+exp(-1+1*(x1+x2)))
  error <- rnorm(length(x1), sd=0.5)
  a <- rbinom(n = n, size = 1, prob=tp)
  y <- 1+x1+x2 +  a*(3 - 2.5*x1 - 2.5*x2) + 
        (0.5 + a*(1+x1+x2)) * error
  return(data.frame(x1=x1,x2=x2,a=a,y=y))
}
## No test: 
n <- 500
testData <- GenerateData.test.IPWE_Mopt(n)
fit <- IPWE_Mopt(data=testData, regimeClass = a~x1+x2, 
                 moPropen=a~x1+x2, 
                 pop.size=1000)
fit
## End(No test)
## Don't show: 
set.seed(1101)
testData <- GenerateData.test.IPWE_Mopt(50)
fit <- IPWE_Mopt(data = testData, regimeClass = a~x1+x2, moPropen=a~x1+x2, 
                 pop.size=500, it.num=2)
fit
## End(Don't show)




