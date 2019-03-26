library(quantoptr)


### Name: IPWE_Qopt
### Title: Estimate the Quantile-optimal Treatment Regime
### Aliases: IPWE_Qopt

### ** Examples

GenerateData <- function(n)
{
  x1 <- runif(n, min=-0.5,max=0.5)
  x2 <- runif(n, min=-0.5,max=0.5)
  error <- rnorm(n, sd= 0.5)
  tp <- exp(-1+1*(x1+x2))/(1+exp(-1+1*(x1+x2)))
  a <- rbinom(n = n, size = 1, prob=tp)
  y <-  1+x1+x2 +  a*(3 - 2.5*x1 - 2.5*x2) +  (0.5 + a*(1+x1+x2)) * error
  return(data.frame(x1=x1,x2=x2,a=a,y=y))
}
n <- 300
testData <- GenerateData(n)

# 1. Estimate the 0.25th-quantile optimal treatment regime. ###
## No test: 
fit1 <- IPWE_Qopt(data = testData, regimeClass = "a~x1+x2",
           tau = 0.25, moPropen="a~x1+x2")
fit1
## End(No test)

# 2. Go parallel. This saves time in calculation. ###
## No test: 
fit2 <- IPWE_Qopt(data = testData, regimeClass = "a~x1+x2",
           tau = 0.25, moPropen="a~x1+x2", cl.setup=2)
fit2
## End(No test)

## Don't show: 
set.seed(1100)
testData2 <- GenerateData(30)
fit2.test <- IPWE_Qopt(data = testData, regimeClass = "a~x1+x2",
           tau = 0.25, moPropen="a~x1+x2", cl.setup=1, pop.size=500, it.num=1, 
           s.tol=0.3)
fit2.test
## End(Don't show)

# 3. Set a quardratic term in the class #######################
## No test: 
fit3 <- IPWE_Qopt(data = testData, regimeClass = "a~x1+x2+I(x1^2)",
                  tau = 0.25, moPropen="a~x1+x2", pop.size=1000)
fit3
## End(No test)

# 4. Set screen prints level. #######################
# Set the p_level to be 0, 
# then all screen prints from the genetic algorithm will be suppressed.
## No test: 
fit4 <- IPWE_Qopt(data = testData, regimeClass = "a~x1+x2",
           tau = 0.25, moPropen="a~x1+x2", cl.setup=2, p_level=0)
fit4
## End(No test)



