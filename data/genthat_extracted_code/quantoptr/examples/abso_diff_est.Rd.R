library(quantoptr)


### Name: abso_diff_est
### Title: Estimate the Gini's mean difference/mean absolute
###   difference(MAD) for a Given Treatment Regime
### Aliases: abso_diff_est

### ** Examples

library(stats)
GenerateData.MAD <- function(n)
{
  x1 <- runif(n)
  x2 <- runif(n)
  tp <- exp(-1+1*(x1+x2))/(1+exp(-1+1*(x1+x2)))
  a<-rbinom(n = n, size = 1, prob=tp)
  error <- rnorm(length(x1))
  y <- (1 + a*0.3*(-1+x1+x2<0) +  a*-0.3*(-1+x1+x2>0)) * error
  return(data.frame(x1=x1,x2=x2,a=a,y=y))
}
## Don't show: 
n <- 50
testData <- GenerateData.MAD(n)
logistic.model.tx <- stats::glm(formula = a~x1+x2, data = testData, family=binomial)
ph <- as.vector(logistic.model.tx$fit)
Cnobs <- combn(1:n, 2)
abso_diff_est(beta=c(1,2,-1), 
              x=model.matrix(a~x1+x2, testData),
              y=testData$y,
              a=testData$a,
              prob=ph,
              Cnobs = Cnobs)

## End(Don't show)

## No test: 
n <- 500
testData <- GenerateData.MAD(n)
logistic.model.tx <- glm(formula = a~x1+x2, data = testData, family=binomial)
ph <- as.vector(logistic.model.tx$fit)
Cnobs <- combn(1:n, 2)
abso_diff_est(beta=c(1,2,-1), 
              x=model.matrix(a~x1+x2, testData),
              y=testData$y,
              a=testData$a,
              prob=ph,
              Cnobs = Cnobs)
## End(No test)



