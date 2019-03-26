library(labstatR)


### Name: Rpa
### Title: Calcola il rendimento di un portafoglio
### Aliases: Rpa
### Keywords: distribution

### ** Examples

x <- c(11,9,25,7,-2)/100
y <- c(-3,15,2,20,6)/100
pxy <- matrix(rep(0,25),5,5)
pxy[1,1] <- 0.2
pxy[2,2] <- 0.2
pxy[3,3] <- 0.2
pxy[4,4] <- 0.2
pxy[5,5] <- 0.2
Rpa(0.1,x,y,pxy)
Rpa(0.5,x,y,pxy)



