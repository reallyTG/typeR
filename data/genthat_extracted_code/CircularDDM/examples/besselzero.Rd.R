library(CircularDDM)


### Name: besselzero
### Title: Find First k Positive Zeros for the Bessel Functions
### Aliases: besselzero

### ** Examples

nu <- seq(0, 5, length.out=10)
output <- matrix(numeric(5*length(nu)), nrow=5)
  for(i in 1:length(nu)) {
    output[,i] <- besselzero(nu[i], 5, 1)
  }
output

output <- matrix(numeric(5*length(nu)), nrow=5)
for(i in 1:length(nu)) {
    output[,i] <- besselzero(nu[i], 5, 2)
}
output



