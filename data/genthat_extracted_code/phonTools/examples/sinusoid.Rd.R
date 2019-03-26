library(phonTools)


### Name: sinusoid
### Title: Create Sinusoids
### Aliases: sinusoid sinusoids

### ** Examples

## several waves, and the sum
sum = sinusoid (freqs = c(100,200,300), amps = c(1,3,2), 
sum = TRUE, show = TRUE)

## no sum, different phase shifts
nosum = sinusoid (freqs = c(100,200,300), amps = c(1,3,2), 
phases = c(pi/2, 0, pi/4), sum = FALSE)



