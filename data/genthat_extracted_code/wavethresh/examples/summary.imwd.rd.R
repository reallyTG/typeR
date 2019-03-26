library(wavethresh)


### Name: summary.imwd
### Title: Print out some basic information associated with an imwd object
### Aliases: summary.imwd
### Keywords: print

### ** Examples

m <- matrix(rnorm(32*32),nrow=32)
mimwd <- imwd(m)
summary(mimwd)
#UNcompressed image wavelet decomposition structure
#Levels:  5 
#Original image was 32 x 32  pixels.
#Filter was:  Daub cmpct on least asymm N=10 
#Boundary handling:  periodic 



