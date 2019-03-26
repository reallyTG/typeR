library(waveslim)


### Name: my.acf
### Title: Autocovariance Functions via the Discrete Fourier Transform
### Aliases: my.acf my.ccf
### Keywords: ts

### ** Examples

data(ibm)
ibm.returns <- diff(log(ibm))
plot(1:length(ibm.returns) - 1, my.acf(ibm.returns), type="h",
     xlab="lag", ylab="ACVS", main="Autocovariance Sequence for IBM Returns")



