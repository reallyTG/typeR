library(primer)


### Name: predpreyLV
### Title: The Lotka-Volterra Predator-prey Model
### Aliases: predpreyLV
### Keywords: methods

### ** Examples

params1 <- c(b=.5, a=.01, s=.2, e=.1) 
Time <- seq(0,100, by=.1) # Set time here
LV.out <- ode(c(H0=25,P0=5), Time, predpreyLV, params1)
matplot(Time, (LV.out[,2:3]), type="l", ylab="Population Size") 



