library(quantoptr)


### Name: augX
### Title: Generate Pseudo-Responses Based on Conditional Quantile
###   Regression Models
### Aliases: augX

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
regimeClass = as.formula(a ~ x1+x2)
moCondQuant_0 = as.formula(y ~ x1+x2+I(x1^2)+I(x2^2))
moCondQuant_1 = as.formula(y ~ exp( 0.11 - x1 - x2)+ x1^2 + p0 + p1*x1
+ p2*x1^2 + p3*x1^3 +p4*x1^4 )
start_1 = list(p0=0, p1=1.5, p2=1, p3 =0,p4=0)

## Not run: 
##D n<-200
##D testdata <- GenerateData.DR(n)
##D fit1 <- augX(raw.data=testdata, txVec = testdata$a,
##D              moCondQuant_0=moCondQuant_0, moCondQuant_1=moCondQuant_1,
##D              nlCondQuant_0=FALSE,   nlCondQuant_1=TRUE,
##D              start_1=start_1, 
##D              clnodes=NULL)  
##D  
##D # How to use parallel computing in AugX(): ##
##D  
##D # on Mac OSX/linux
##D  clnodes <- parallel::makeForkCluster(nnodes =getOption("mc.cores",2))
##D  fit2 <- augX(raw.data=testdata, length.out = 5, txVec = testdata$a,
##D              moCondQuant_0=moCondQuant_0, moCondQuant_1=moCondQuant_1,
##D              nlCondQuant_0=FALSE,   nlCondQuant_1=TRUE,
##D              start_1=start_1, 
##D              clnodes=clnodes)  
##D   
##D # on Windows
##D  clnodes <- parallel::makeCluster(2, type="PSOCK")
##D  fit3 <- augX(raw.data=testdata, length.out = 5, txVec = testdata$a,
##D              moCondQuant_0=moCondQuant_0, moCondQuant_1=moCondQuant_1,
##D              nlCondQuant_0=FALSE,   nlCondQuant_1=TRUE,
##D              start_1=start_1, 
##D              clnodes=clnodes)  
##D  
## End(Not run)
## Don't show: 
 
n<-100
testdata.parallel <- GenerateData.DR(n)
  foo <- augX(raw.data=testdata.parallel, length.out = 5, txVec = testdata.parallel$a,
             moCondQuant_0=moCondQuant_0, moCondQuant_1=moCondQuant_1,
             nlCondQuant_0=FALSE,   nlCondQuant_1=TRUE,
             start_1=start_1, clnodes=NULL)
             
## End(Don't show) 
 
 



