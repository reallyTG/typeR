library(LambertW)


### Name: gamma_01
### Title: Input parameters to get a zero mean, unit variance output for a
###   given gamma
### Aliases: gamma_01
### Keywords: math

### ** Examples


gamma_01(0) # for gamma = 0, input == output, therefore (0,1,0,0,1)
# input mean must be slightly negative to get a zero-mean output
gamma_01(0.1) # gamma = 0.1 means it is positively skewed
gamma_01(1)




