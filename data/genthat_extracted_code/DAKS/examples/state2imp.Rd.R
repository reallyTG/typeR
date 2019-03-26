library(DAKS)


### Name: state2imp
### Title: Transformation from Knowledge States to Implications
### Aliases: state2imp
### Keywords: manip math models utilities

### ** Examples

## an arbitrary matrix of knowledge states is defined
x <- matrix(0, nrow = 5, ncol = 3)
x[1, ] <- c(0, 0, 0)
x[2, ] <- c(0, 0, 1)
x[3, ] <- c(0, 1, 0)
x[4, ] <- c(0, 1, 1)
x[5, ] <- c(1, 1, 1)

state2imp(x)



