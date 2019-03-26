library(quantoptr)


### Name: TwoStg_Mopt
### Title: Estimate the Two-stage Mean-Optimal Treatment Regime
### Aliases: TwoStg_Mopt

### ** Examples

ilogit <- function(x) exp(x)/(1 + exp(x))
GenerateData.2stg <- function(n){
 x1 <- runif(n)
 p1 <- ilogit(-0.5+x1)
 a1 <- rbinom(n, size=1, prob=p1)
 
 x2 <- runif(n, x1, x1+1)
 p2 <- ilogit(-1 + x2)
 a2 <- rbinom(n, size=1, prob=p2)
 
 mean <- 1+x1+a1*(1-3*(x1-0.2)^2) +x2 + a2*(1-x2-x1)
 y <- mean + (1+a1*(x1-0.5)+0.5*a2*(x2-1))*rnorm(n,0,sd = 1)
 return(data.frame(x1,a1,x2,a2,y))
}

n <- 400
testdata <- GenerateData.2stg(n)
## No test: 
fit <- TwoStg_Mopt(data=testdata, 
                   regimeClass.stg1="a1~x1", regimeClass.stg2="a2~x1+a1+x2",
                   moPropen1="a1~x1", moPropen2="a2~x2",
                   cl.setup=2)
fit

fit2 <- TwoStg_Mopt(data=testdata, 
                   regimeClass.stg1="a1~x1", regimeClass.stg2="a2~a1+x1*x2",
                   moPropen1="a1~x1", moPropen2="a2~x2",
                   cl.setup=2)
fit2

## End(No test)

## Don't show: 
set.seed(11000)
testdata2 <- GenerateData.2stg(30)
fit2 <- TwoStg_Mopt(data=testdata2, 
                   regimeClass.stg1="a1~x1", regimeClass.stg2="a2~x2",
                   moPropen1="a1~x1", moPropen2="a2~x2",
                   cl.setup=1, pop.size=500, it.num=1, s.tol=0.3)
fit2
## End(Don't show)



