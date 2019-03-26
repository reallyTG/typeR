library(spMC)


### Name: which_lines
### Title: Points Classification through Directional Lines
### Aliases: which_lines
### Keywords: spatial classif

### ** Examples
## No test: 
data(ACM)

direction <- c(0,0,1)

loc.id <- which_lines(ACM[, 1:3], direction)
## End(No test)



