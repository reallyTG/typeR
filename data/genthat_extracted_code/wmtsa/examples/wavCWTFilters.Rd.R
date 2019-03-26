library(wmtsa)


### Name: wavCWTFilters
### Title: Frequency response of continuous wavelet transform filters
### Aliases: wavCWTFilters
### Keywords: univar

### ** Examples

## set the plot grid 
old.plt <- ifultools::splitplot(2,2,1)

## create a frequency vector 
w <- seq(-10,10,length=1000)

## calculate the frequency responses for various 
## mother wavelets and plot the results 

wavelets <- c("haar", "gaussian1", "gaussian2", "morlet")

for (i in seq(wavelets)){
    if (i > 1) ifultools::splitplot(2,2,i)
    filt <- wavelets[i]
    plot(w, abs(wavCWTFilters(wavelet=filt, frequency=w)),
       ylab="|Psi(w)|", xlab="frequency", type="l")
title(filt)
}

par(old.plt)



