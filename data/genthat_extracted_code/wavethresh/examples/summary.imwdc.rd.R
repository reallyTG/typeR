library(wavethresh)


### Name: summary.imwdc
### Title: Print out some basic information associated with an imwdc object
### Aliases: summary.imwdc
### Keywords: print

### ** Examples

m <- matrix(rnorm(32*32),nrow=32)
mimwd <- imwd(m)
mimwdc <- threshold(mimwd)
summary(mimwdc)
#Compressed image wavelet decomposition structure
#Levels:  5 
#Original image was 32 x 32  pixels.
#Filter was:  Daub cmpct on least asymm N=10 
#Boundary handling:  periodic 



