library(sde)


### Name: dcSim
### Title: Pedersen's simulated transition density
### Aliases: dcSim
### Keywords: datagen ts

### ** Examples

## Not run: 
##D d1 <- function(t,x,theta) theta[1]*(theta[2]-x)
##D s1 <- function(t,x,theta) theta[3]*sqrt(x)
##D 
##D from <- 0.08
##D x <- seq(0,0.2, length=100)
##D sle10 <- NULL
##D sle2 <- NULL
##D sle5 <- NULL
##D true <- NULL
##D set.seed(123)
##D for(to in x){
##D  sle2 <- c(sle2, dcSim(from, to, 0.5, d1, s1, 
##D     theta=c(2,0.02,0.15), M=50000,N=2))
##D  sle5 <- c(sle5, dcSim(from, to, 0.5, d1, s1, 
##D     theta=c(2,0.02,0.15), M=50000,N=5))
##D  sle10 <- c(sle10, dcSim(from, to, 0.5, d1, s1, 
##D     theta=c(2,0.02,0.15), M=50000,N=10))
##D  true <- c(true, dcCIR(to, 0.5, from, c(2*0.02,2,0.15)))
##D }
##D 
##D par(mar=c(5,5,1,1))
##D plot(x, true, type="l", ylab="conditional density")
##D lines(x, sle2, lty=4)
##D lines(x, sle5, lty=2)
##D lines(x, sle10, lty=3)
##D legend(0.15,20, legend=c("exact","N=2", "N=5", "N=10"), 
##D    lty=c(1,2,4,3))
## End(Not run)


