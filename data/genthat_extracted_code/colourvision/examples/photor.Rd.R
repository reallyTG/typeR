library(colourvision)


### Name: photor
### Title: Photoreceptor sensitivity spectra.
### Aliases: photor

### ** Examples

## Generates photoreceptor sensitivity
## values with lambda max at 350nm, 450nm and 550nm:
C<-photor(lambda.max=c(350,450,550))

plot(C[,2]~C[,1], type="l", col="violet")
lines(C[,3]~C[,1], type="l", col="blue")
lines(C[,4]~C[,1], type="l", col="green")



