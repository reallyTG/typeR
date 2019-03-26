library(TIMP)


### Name: baseIRF
### Title: Baseline subtraction from a vector, usually representing an IRF.
### Aliases: baseIRF
### Keywords: file

### ** Examples
 
irfvec <- rnorm(128, mean=1) 
plot(irfvec,type="l") 
irfvec_corrected <- baseIRF(irfvec, 1, 10)
lines(irfvec_corrected, col=2)



