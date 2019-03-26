library(quantoptr)


### Name: IPWE_MADopt
### Title: Estimation of the Optimal Treatment Regime defined as Minimizing
###   Gini's Mean Differences
### Aliases: IPWE_MADopt

### ** Examples

GenerateData.MAD <- function(n)
{
  x1 <- runif(n)
  x2 <- runif(n)
  tp <- exp(-1+1*(x1+x2))/(1+exp(-1+1*(x1+x2)))
  a<-rbinom(n = n, size = 1, prob=tp)
  error <- rnorm(length(x1))
  y <- (1 + a*0.6*(-1+x1+x2<0) +  a*-0.6*(-1+x1+x2>0)) * error
  return(data.frame(x1=x1,x2=x2,a=a,y=y))
}
# The true MAD optimal treatment regime for this generative model
# can be deduced trivially, and it is:  c( -0.5773503,  0.5773503,  0.5773503).
## Don't show: 
  set.seed(1103)
  testData <- GenerateData.MAD(30)
  fit0 <- IPWE_MADopt(data = testData, regimeClass = a~x1+x2,
             moPropen=a~x1+x2, s.tol=0.2,
             pop.size=300, it.num=2)
## End(Don't show)

# With correctly specified propensity model   ####
## No test: 
n <- 400
testData <- GenerateData.MAD(n)
fit1 <- IPWE_MADopt(data = testData, regimeClass = a~x1+x2,
                    moPropen=a~x1+x2, cl.setup=2)
fit1
## End(No test)
             


# With incorrectly specified propensity model ####
## No test: 
fit2 <- IPWE_MADopt(data = testData, regimeClass = a~x1+x2,
                    moPropen="BinaryRandom", cl.setup=2)
fit2
## End(No test)




