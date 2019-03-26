library(modcmfitr)


### Name: rModCM
### Title: Sample from modified Connor-Mosimann distribution
### Aliases: rModCM
### Keywords: Connor-Mosimann modified

### ** Examples

n <- 1000
Z <- matrix(data = c(1.098, 3.070, 0.66, 0.85,
                   9.021, 7.990, 0.62, 1,
                   10, 0.01, 0.14, 0.58,
                   10, 10, 0.57, 1),ncol=4,byrow=TRUE)
rModCM(n,Z)



