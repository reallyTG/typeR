library(psych)


### Name: neo
### Title: NEO correlation matrix from the NEO_PI_R manual
### Aliases: neo
### Keywords: datasets

### ** Examples

data(neo)
n5 <- fa(neo,5)
neo.keys <- make.keys(30,list(N=c(1:6),E=c(7:12),O=c(13:18),A=c(19:24),C=c(25:30)))
n5p <- target.rot(n5,neo.keys) #show a targeted rotation for simple structure
n5p




