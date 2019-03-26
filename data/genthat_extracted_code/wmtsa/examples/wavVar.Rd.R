library(wmtsa)


### Name: wavVar
### Title: Discrete wavelet variance estimation
### Aliases: wavVar plot.wavVar print.wavVar summary.wavVar
###   print.summary.wavVar
### Keywords: univar

### ** Examples

## create sequence 
x <- make.signal("doppler")

## perform a time independent wavelet variance 
## analysis 
vmod <- wavVar(x)

## plot the result 
plot(vmod, pch=15, title="Wavelet Variance of Doppler")

## calculate wavelet variance estimaates for the 
## ocean series and calculate EDOF mode 2 
## estimates and corresponding 95 percent 
## confidence intervals 
## Not run: 
##D vocean <- wavVar(ocean, sdf=oceansdf, wavelet="d6")
##D 
##D ## summarize the results 
##D plot(vocean, edof=1:3)
##D 
##D summary(vocean)
## End(Not run)



