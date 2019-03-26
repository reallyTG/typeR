library(zipfR)


### Name: vgc.interp
### Title: Expected Vocabulary Growth by Binomial Interpolation (zipfR)
### Aliases: vgc.interp
### Keywords: manip distribution

### ** Examples


## load the Tiger PP expansion spectrum
## (sample size: about 91k tokens) 
data(TigerPP.spc)

## binomially interpolated curve
TigerPP.bin.vgc <- vgc.interp(TigerPP.spc,(1:100)*910)
summary(TigerPP.bin.vgc)

## let's also add growth of V_1 to V_5 and plot
TigerPP.bin.vgc <- vgc.interp(TigerPP.spc,(1:100)*910,m.max=5)
plot(TigerPP.bin.vgc,add.m=c(1:5))





