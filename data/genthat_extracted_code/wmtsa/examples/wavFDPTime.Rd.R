library(wmtsa)


### Name: wavFDPTime
### Title: Instantaneous estimation of fractionally differenced model
###   parameters
### Aliases: wavFDPTime
### Keywords: models

### ** Examples

## perform a unbiased instantaneous LSE of FD 
## parameters for an FD(0.45, 1) realization 
## over levels 1 through 6 using Daubechies 
## least asymmetric 8-tap filters. Use a zeroth 
## order DOF (equivalent to 1 chi-square DOF) 
z <- wavFDPTime(fdp045, levels=1:6, wavelet="s8", est="lse", biased=FALSE)

## display the results 
print(z)

## plot the results 
plot(z)

## plot the results with the confidence intervals 
## centered about the mean (known) value of the 
## the FD parameter 
plot(z, mean.delta=0.45)



