library(spTimer)


### Name: spT.validation2
### Title: Validation Commands
### Aliases: spT.validation2
### Keywords: utility

### ** Examples

##

# Create `x', which is the true values.
# Create `y', which is the predicted values.

x <- rnorm(100,0,0.1)
y <- rnorm(100,0,1)
spT.validation2(x, y, cutoff=0,names=TRUE)

##



