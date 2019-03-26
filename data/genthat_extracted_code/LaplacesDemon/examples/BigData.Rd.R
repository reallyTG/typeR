library(LaplacesDemon)


### Name: BigData
### Title: Big Data
### Aliases: BigData
### Keywords: High Performance Computing Utility

### ** Examples

### Below is an example of a linear regression model specification
### function in which BigData reads in a batch of 1,000 records of
### Data$N records from a data set that is too large to fully open
### in memory. The example simulates on 10,000 records, which is
### not big data; it's just a toy example. The data set is file X.csv,
### and the first column of matrix X is the dependent variable y. The
### user supplies a function to BigData along with parameters beta and
### sigma. When each batch of 1,000 records is read in,
### mu = XB is calculated, and then the LL is calculated as
### y ~ N(mu, sigma^2). These results are added together from all
### batches, and returned as LL.

library(LaplacesDemon)
N <- 10000
J <- 10 #Number of predictors, including the intercept
X <- matrix(1,N,J)
for (j in 2:J) {X[,j] <- rnorm(N,runif(1,-3,3),runif(1,0.1,1))}
beta.orig <- runif(J,-3,3)
e <- rnorm(N,0,0.1)
y <- as.vector(tcrossprod(beta.orig, X) + e)
mon.names <- c("LP","sigma")
parm.names <- as.parm.names(list(beta=rep(0,J), log.sigma=0))
PGF <- function(Data) return(c(rnormv(Data$J,0,0.01),
     log(rhalfcauchy(1,1))))
MyData <- list(J=J, PGF=PGF, N=N, mon.names=mon.names,
     parm.names=parm.names) #Notice that X and y are not included here
write.table(cbind(y,X), "X.csv", sep=",", row.names=FALSE,
  col.names=FALSE)

Model <- function(parm, Data)
     {
     ### Parameters
     beta <- parm[1:Data$J]
     sigma <- exp(parm[Data$J+1])
     ### Log(Prior Densities)
     beta.prior <- sum(dnormv(beta, 0, 1000, log=TRUE))
     sigma.prior <- dhalfcauchy(sigma, 25, log=TRUE)
     ### Log-Likelihood
     LL <- BigData(file="X.csv", nrow=Data$N, ncol=Data$J+1, size=1000,
          Method="add", CPUs=1, Type="PSOCK",
          FUN=function(x, beta, sigma) sum(dnorm(x[,1], tcrossprod(x[,-1],
               t(beta)), sigma, log=TRUE)), beta, sigma)
     ### Log-Posterior
     LP <- LL + beta.prior + sigma.prior
     Modelout <- list(LP=LP, Dev=-2*LL, Monitor=c(LP,sigma),
          yhat=0,#rnorm(length(mu), mu, sigma),
          parm=parm)
     return(Modelout)
     }

### From here, the user may update the model as usual.



