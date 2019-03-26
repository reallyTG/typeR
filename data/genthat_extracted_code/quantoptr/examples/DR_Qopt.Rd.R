library(quantoptr)


### Name: DR_Qopt
### Title: The Doubly Robust Estimator of the Quantile-Optimal Treatment
###   Regime
### Aliases: DR_Qopt

### ** Examples

ilogit <- function(x) exp(x)/(1 + exp(x))
GenerateData.DR <- function(n)
{
 x1 <- runif(n,min=-1.5,max=1.5)
 x2 <- runif(n,min=-1.5,max=1.5)
 tp <- ilogit( 1 - 1*x1^2 - 1* x2^2)
 a <-rbinom(n,1,tp)
 y <- a * exp(0.11 - x1- x2) + x1^2 + x2^2 +  a*rgamma(n, shape=2*x1+3, scale = 1) +
 (1-a)*rnorm(n, mean = 2*x1 + 3, sd = 0.5)
 return(data.frame(x1=x1,x2=x2,a=a,y=y))
}

regimeClass <- as.formula(a ~ x1+x2)
moCondQuant_0 <- as.formula(y ~ x1+x2+I(x1^2)+I(x2^2))
moCondQuant_1 <- as.formula(y ~ exp( 0.11 - x1 - x2)+ x1^2 + p0 + p1*x1
                           + p2*x1^2 + p3*x1^3 +p4*x1^4 )
start_1 = list(p0=0, p1=1.5, p2=1, p3 =0,p4=0)

## Don't show: 
   
  n.test<-30
  set.seed(1200)
  testdata2 <- GenerateData.DR(n.test)
  fit0 <- DR_Qopt(data=testdata2, regimeClass = a ~ x1+x2, tau = 0.2,
                 moPropen = a~I(x1^2)+I(x2^2),
                 moCondQuant_0 = moCondQuant_0,
                 moCondQuant_1 = moCondQuant_1,
                 length.out = 2, 
                 p_level=1, s.tol=0.5,
                 nlCondQuant_1 = TRUE,  start_1=start_1,
                 pop.size = 500, it.num =1)
## End(Don't show)

n <- 400
testdata <- GenerateData.DR(n)

## Examples below correctly specified both the propensity model and 
##  the conditional quantile model.
 ## No test: 
 
 system.time(
 fit1 <- DR_Qopt(data=testdata, regimeClass = regimeClass, 
                 tau = 0.25,
                 moPropen = a~I(x1^2)+I(x2^2),
                 moCondQuant_0 = moCondQuant_0,
                 moCondQuant_1 = moCondQuant_1,
                 nlCondQuant_1 = TRUE,  start_1=start_1,
                 pop.size = 1000))
 fit1
## End(No test)
 ## Go parallel for the same fit. It would save a lot of time.
 ### Could even change the cl.setup to larger values 
 ### if more cores are available.
 ## No test: 
 
 system.time(fit2 <- DR_Qopt(data=testdata, regimeClass = regimeClass, 
                 tau = 0.25,
                 moPropen = a~I(x1^2)+I(x2^2),
                 moCondQuant_0 = moCondQuant_0,
                 moCondQuant_1 = moCondQuant_1,
                 nlCondQuant_1 = TRUE,  start_1=start_1,
                 pop.size = 1000, cl.setup=2))
 fit2
## End(No test)




