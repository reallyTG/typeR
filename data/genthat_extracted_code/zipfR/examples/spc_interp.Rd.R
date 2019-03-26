library(zipfR)


### Name: spc.interp
### Title: Expected Frequency Spectrum by Binomial Interpolation (zipfR)
### Aliases: spc.interp
### Keywords: manip distribution

### ** Examples


## load the Tiger NP expansion spectrum
## (sample size: about 109k tokens) 
data(TigerNP.spc)

## interpolated expected frequency subspectrum of 50k tokens
TigerNP.sub.spc <- spc.interp(TigerNP.spc,5e+4)
summary(TigerNP.sub.spc)

## previous is slow since it calculates all expected  spectrum
## elements; suppose we only need the first 10 expected
## spectrum element frequencies; then we can do:
TigerNP.sub.spc <- spc.interp(TigerNP.spc,5e+4,m.max=10) # much faster!
summary(TigerNP.sub.spc)




