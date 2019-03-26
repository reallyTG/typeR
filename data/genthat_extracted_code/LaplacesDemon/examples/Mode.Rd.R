library(LaplacesDemon)


### Name: Mode
### Title: The Mode(s) of a Vector
### Aliases: is.amodal is.bimodal is.multimodal is.trimodal is.unimodal
###   Mode Modes
### Keywords: Mode Utility

### ** Examples

library(LaplacesDemon)
### Below are distributions with different numbers of modes.
x <- c(1,1) #Amodal
x <- c(1,2,2,2,3) #Unimodal
x <- c(1,2) #Bimodal
x <- c(1,3,3,3,3,4,4,4,4,4) #min.size affects the answer
x <- c(1,1,3,3,3,3,4,4,4,4,4) #Trimodal

### And for each of the above, the functions below may be applied.
Mode(x)
Modes(x)
is.amodal(x)
is.bimodal(x)
is.multimodal(x)
is.trimodal(x)
is.unimodal(x)



