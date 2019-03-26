library(zipfR)


### Name: zipfR-package
### Title: zipfR: lexical statistics in R
### Aliases: zipfR-package zipfR
### Keywords: package

### ** Examples

## load Oliver Twist and Great Expectations frequency spectra
data(DickensOliverTwist.spc)
data(DickensGreatExpectations.spc)

## check sample size and vocabulary and hapax counts
N(DickensOliverTwist.spc)
V(DickensOliverTwist.spc)
Vm(DickensOliverTwist.spc,1)
N(DickensGreatExpectations.spc)
V(DickensGreatExpectations.spc)
Vm(DickensGreatExpectations.spc,1)

## compute binomially interpolated growth curves
ot.vgc <- vgc.interp(DickensOliverTwist.spc,(1:100)*1570)
ge.vgc <- vgc.interp(DickensGreatExpectations.spc,(1:100)*1865)

## plot them
plot(ot.vgc,ge.vgc,legend=c("Oliver Twist","Great Expectations"))

## load Dickens' works frequency spectrum
data(Dickens.spc)

## compute Zipf-Mandelbrot model from Dickens data
## and look at model summary
zm <- lnre("zm",Dickens.spc)
zm

## plot observed and expected spectrum
zm.spc <- lnre.spc(zm,N(Dickens.spc))
plot(Dickens.spc,zm.spc)

## obtain expected V and V1 values at arbitrary sample sizes
EV(zm,1e+8)
EVm(zm,1,1e+8)

## generate expected V and V1 growth curves up to a sample size
## of 10 million tokens and plot them, with vertical line at 
## estimation size
ext.vgc <- lnre.vgc(zm,(1:100)*1e+5,m.max=1)
plot(ext.vgc,N0=N(zm),add.m=1)





