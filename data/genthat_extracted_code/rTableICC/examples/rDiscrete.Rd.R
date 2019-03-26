library(rTableICC)


### Name: rDiscrete
### Title: Generate a Random Data from Discrete Probability Function
### Aliases: rDiscrete
### Keywords: datagen discrete distribution

### ** Examples

p = c(0.23,0.11,0.05,0.03,0.31,0.03,0.22,0.02)
rDiscrete(n=2,pf=p)

# pf would be entered as a matrix:

p = matrix(c(0.23,0.11,0.05,0.03,0.31,0.03,0.22,0.02), nrow=2, ncol=4, byrow = TRUE) 
rDiscrete(n=2,pf=p)

p = matrix(c(0.23,0.11,0.05,0.03,0.31,0.03,0.22,0.02), nrow=4, ncol=2, byrow = TRUE) 
rDiscrete(n=2,pf=p)

# or pf would be entered as a three dimensional array:

p = array(c(0.23,0.11,0.05,0.03,0.31,0.03,0.22,0.02), dim=c(2,2,2))
rDiscrete(n=2,pf=p)



