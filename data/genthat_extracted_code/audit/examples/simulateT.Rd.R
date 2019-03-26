library(audit)


### Name: simulateT
### Title: Simulating the Total Number of Accounts in Error
### Aliases: simulateT
### Keywords: misc

### ** Examples

grd <- seq(0.0001,0.15,length = 11)
smp <- c(2,1,0)
n <- c(75,50,25)
N <- c(5000,3000,2000)
as.numeric(quantile(simulateT(smp,n,N,grd,40000),0.95))



