library(quantoptr)


### Name: TwoStg_Qopt
### Title: Estimate the Two-stage Quantile-optimal Treatment Regime
### Aliases: TwoStg_Qopt

### ** Examples

ilogit <- function(x) exp(x)/(1 + exp(x))
GenerateData.2stg <- function(n){
 x1 <- runif(n)
 p1 <- ilogit(-0.5+x1)
 a1 <- rbinom(n, size=1, prob=p1)
 
 x2 <- runif(n,x1,x1+1)
 p2 <- ilogit(-1 + x2)
 a2 <- rbinom(n, size=1, prob=p2)
 
 mean <- 1+x1+a1*(1-3*(x1-0.2)^2) +x2 + a2*(1-x2-x1)
 y <- mean + (1+a1*(x1-0.5)+0.5*a2*(x2-1))*rnorm(n,0,sd = 1)
 return(data.frame(x1,a1,x2,a2,y))
}
## No test: 
n <- 400
testdata <- GenerateData.2stg(n)
fit <- TwoStg_Qopt(data=testdata, tau=0.2,
                   regimeClass.stg1=a1~x1, regimeClass.stg2=a2~x1+a1+x2,
                   moPropen1=a1~x1, moPropen2=a2 ~ x2,
                   cl.setup=2)
fit
## End(No test)

## Don't show: 
set.seed(11001)
testdata <- GenerateData.2stg(30)
fit <- TwoStg_Qopt(data=testdata, tau=0.2, 
                   regimeClass.stg1=a1~x1, regimeClass.stg2=a2~x2,
                   moPropen1=a1~x1, moPropen2=a2 ~ x2,
                   p_level=0,
                   cl.setup=1, pop.size=300, it.num=1, s.tol=0.1)
## End(Don't show)



