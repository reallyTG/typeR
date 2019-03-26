library(divDyn)


### Name: fill
### Title: Filling of missing values in a vector, based on the marginal
###   values of the gaps
### Aliases: fill

### ** Examples

# forward, replace with previous
dummy<- c(TRUE, FALSE, NA, TRUE, FALSE, NA)
fill(dummy)

# forward, replace with previous+1
dummy2 <- c(1,NA, 3, 1, 2, NA, NA, 9, NA,3)
fill(dummy2, inc=1)

# backward, replace with previous in loop direction
fill(dummy2, inc=0, forward=FALSE)



