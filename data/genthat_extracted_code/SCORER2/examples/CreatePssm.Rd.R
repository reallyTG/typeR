library(SCORER2)


### Name: CreatePssm
### Title: Compute profile scoring matrices for training data
### Aliases: CreatePssm

### ** Examples

# load training data
data(training)

# define allowed amino and register characters
var <- list(
    amino = c("A","C","D","E","F","G","H","I","K","L",
    "M","N","P","Q","R","S","T","V","W","Y","X"),
    register = letters[1:7])

# create profile scoring matrix
pssm <- CreatePssm(training, var)
      



