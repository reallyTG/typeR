library(labstatR)


### Name: trajectory
### Title: Simulatore di processi di diffusione
### Aliases: trajectory
### Keywords: distribution

### ** Examples

n <- 100
T <- 1
x0 <- 1
mu <- function(x,t) {-x*t}
sigma <- function(x,t) {x*t}
diff <- trajectory(1,0,1,mu,sigma,100)
plot(diff$t,diff$y,type="l")
acf(diff$y, main="Processo di diffusione")



