library(KernelKnn)


### Name: ionosphere
### Title: Johns Hopkins University Ionosphere database (binary
###   classification)
### Aliases: ionosphere
### Keywords: datasets

### ** Examples


data(ionosphere)

X = ionosphere[, -ncol(ionosphere)]

y = ionosphere[, ncol(ionosphere)]



