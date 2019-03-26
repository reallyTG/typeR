library(MSnbase)


### Name: Chromatogram-class
### Title: Representation of chromatographic MS data
### Aliases: Chromatogram-class Chromatogram aggregationFun
###   show,Chromatogram-method rtime,Chromatogram-method
###   intensity,Chromatogram-method mz,Chromatogram-method
###   precursorMz,Chromatogram-method fromFile,Chromatogram-method
###   length,Chromatogram-method as.data.frame,Chromatogram-method
###   filterRt,Chromatogram-method clean,Chromatogram-method
###   plot,Chromatogram,ANY-method msLevel,Chromatogram-method
###   isEmpty,Chromatogram-method productMz,Chromatogram-method productMz
###   bin,Chromatogram-method

### ** Examples


## Create a simple Chromatogram object.
ints <- abs(rnorm(100, sd = 100))
rts <- seq_len(length(ints))
chr <- Chromatogram(rtime = rts, intensity = ints)
chr

## Extract intensities
intensity(chr)

## Extract retention times
rtime(chr)

## Extract the mz range - is NA for the present example
mz(chr)

## plot the Chromatogram
plot(chr)

## Create a simple Chromatogram object based on random values.
chr <- Chromatogram(intensity = abs(rnorm(1000, mean = 2000, sd = 200)),
        rtime = sort(abs(rnorm(1000, mean = 10, sd = 5))))
chr

## Get the intensities
head(intensity(chr))

## Get the retention time
head(rtime(chr))

## What is the retention time range of the object?
range(rtime(chr))

## Filter the chromatogram to keep only values between 4 and 10 seconds
chr2 <- filterRt(chr, rt = c(4, 10))

range(rtime(chr2))



