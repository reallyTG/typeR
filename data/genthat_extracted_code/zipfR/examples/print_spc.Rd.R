library(zipfR)


### Name: print.spc
### Title: Printing Frequency Spectra (zipfR)
### Aliases: print.spc summary.spc
### Keywords: print

### ** Examples


## load Brown verbs dataset
data(BrownVer.spc)

## look at summary and print BrownVer.spc
summary(BrownVer.spc)
print(BrownVer.spc)

## print all non-zero spectrum elements
print(BrownVer.spc,all=TRUE)

## estimate zm model and construct expected spectrum with
## variances
zm <- lnre("zm",BrownVer.spc)
zm.spc <- lnre.spc(zm,N(zm),variances=TRUE)

## summary and print for the expected spectrum
summary(zm.spc)
print(zm.spc)




