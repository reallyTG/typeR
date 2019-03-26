library(primer)


### Name: SIRbd
### Title: The S-I-R Epidemilogical Disease Model with Births and Deaths
### Aliases: SIRbd
### Keywords: methods

### ** Examples

library(deSolve)
N <- 10^6; R <- 0; I <- 1; S <- N - I - R
g <- 1/(13/365); b <- 1/50; 
age <- 5; R0 <- 1 + 1/(b*age)
B <- R0 * (g + b) / N
parms <- c(B = B, g = g, b = b, m=b)
years <- seq(0,30, by=.1)
SIRbd.out <- data.frame(ode(c(S=S,I=I,R=R), years, SIRbd, parms, hmax=.01)) 
matplot(SIRbd.out[,1], sqrt(SIRbd.out[,-1]), type='l', 
        lty=1:3, ylab="sqrt(No. of Individuals)", xlab='Years')
legend('right', c('S','I','R'), lty=1:3, col=1:3, bty='n')



