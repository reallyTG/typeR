library(ALS)


### Name: multiex
### Title: Data inspired by GC mass spectrometry experiments
### Aliases: multiex d1 d2 Cstart1 Cstart2 S x x2
### Keywords: datasets

### ** Examples

data("multiex")
## mass spectra in the data 
plotS(S,x2)

## starting values for elution profiles
matplot(x,Cstart1,type="l")
matplot(x,Cstart2,type="l",add=TRUE)



