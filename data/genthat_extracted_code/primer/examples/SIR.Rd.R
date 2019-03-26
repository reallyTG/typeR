library(primer)


### Name: SIR
### Title: The S-I-R Epidemilogical Disease Model
### Aliases: SIR
### Keywords: methods

### ** Examples

N <- 10^3; I <- R <- 1; S <- N - I - R
parms <- c(B=.01, g=4)
months <- seq(0, 3, by=0.01)
require(deSolve)
SIR.out <- data.frame( ode(c(S,I,R), months, SIR, parms) )
matplot(months, SIR.out[,-1], type='l')
legend('right', c('R', 'I', 'S'), lty=3:1, col=3:1, bty='n')



