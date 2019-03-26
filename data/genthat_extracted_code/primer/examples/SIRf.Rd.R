library(primer)


### Name: SIRf
### Title: The S-I-R Epidemilogical Disease Model with Frequency Dependent
###   Transmission
### Aliases: SIRf
### Keywords: methods

### ** Examples

R <- 0; S <- 1000;  I <- 1000; N <- S+I+R
parmsf <- c(B=1, g=1)
Months <- seq(0, 8, by=0.1)
outf <- ode(c(S,I,R), Months, SIRf, parmsf)
matplot(Months, outf[,-1], type='l', ylab="Prevalence (I/N)")
legend('right', legend=c('S','I','R'), lty=1:3, col=1:3, bty='n')



