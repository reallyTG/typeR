library(yuima)


### Name: setSampling
### Title: Set sampling information and create a 'sampling' object.
### Aliases: setSampling
### Keywords: ts

### ** Examples

samp <- setSampling(Terminal=1, n=1000)
str(samp)

samp <- setSampling(Terminal=1, n=1000, delta=0.3)
str(samp)


samp <- setSampling(Terminal=1, n=1000, delta=c(0.1,0.3))
str(samp)

samp <- setSampling(Terminal=1:3, n=1000)
str(samp)



