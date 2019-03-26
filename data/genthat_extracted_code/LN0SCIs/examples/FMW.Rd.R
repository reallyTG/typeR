library(LN0SCIs)


### Name: FMW
### Title: FMW
### Aliases: FMW FMW0

### ** Examples



alpha <- 0.05
p <- c(0.1,0.15,0.1)
n <- c(30,30,30)
mu <- c(0,0,0)
sigma <- c(1,1,1)
N <- 500

FMW(n,p,mu,sigma,N)

## Not run: 
##D p <- c(0.1,0.15,0.1,0.6)
##D n <- c(30,15,10,50)
##D mu <- c(1,1.3,2,0)
##D sigma <- c(1,1,1,2)
##D C2 <- rbind(c(-1,1,0,0),c(-1,0,1,0),c(-1,0,0,1),c(0,-1,1,0),c(0,-1,0,1),c(0,0,-1,1))
##D N <- 1000
##D 
##D FMW(n,p,mu,sigma,N,C2 = C2)
## End(Not run)




