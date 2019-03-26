library(SharpeR)


### Name: predint
### Title: prediction interval for Sharpe ratio
### Aliases: predint

### ** Examples


# should reject null
etc <- predint(rnorm(1000,mean=0.5,sd=0.1),oosdf=127,ope=1)
etc <- predint(matrix(rnorm(1000*5,mean=0.05),ncol=5),oosdf=63,ope=1)

# check coverage
mu <- 0.0005
sg <- 0.013
n1 <- 512
n2 <- 256
p  <- 100
x1 <- matrix(rnorm(n1*p,mean=mu,sd=sg),ncol=p)
x2 <- matrix(rnorm(n2*p,mean=mu,sd=sg),ncol=p)
sr1 <- as.sr(x1)
sr2 <- as.sr(x2)
## Not run: 
##D # takes too long to run ... 
##D etc1 <- predint(sr1,oosdf=n2-1,level=0.95)
##D is.ok <- (etc1[,1] <= sr2$sr) & (sr2$sr <= etc1[,2])
##D covr <- mean(is.ok)
## End(Not run)




