library(quantspec)


### Name: frequenciesValidator
### Title: Validates if frequencies are Fourier frequencies from [0,pi].
### Aliases: frequenciesValidator
### Keywords: Validator-functions

### ** Examples

freq <- 2*pi*c(3,2,5,8,9)/10

res <- frequenciesValidator(freq, N=10, steps=1:3)
res * 10 / (2*pi) # Returns: [1] 3 2 5 8 9

res <- frequenciesValidator(freq, N=10, steps=1:4)
res * 10 / (2*pi) # Returns: [1] 3 2 5 2 1

res <- frequenciesValidator(freq, N=10, steps=1:5)
res * 10 / (2*pi) # Returns: [1] 3 2 5 1

res <- frequenciesValidator(freq, N=10, steps=1:6)
res * 10 / (2*pi) # Returns: [1] 1 2 3 5



