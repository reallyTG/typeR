library(joineR)


### Name: to.unbalanced
### Title: Transform data to the longitudinal unbalanced format
### Aliases: to.unbalanced
### Keywords: data manip

### ** Examples

simul <- data.frame(num = 1:10,
                    Y1.1 = rnorm(10), Y1.2 = rnorm(10),
                    Y2.1 = rnorm(10), Y2.2 = rnorm(10), 
                    age = rnorm(10))
to.unbalanced(simul, id.col = 1, times = c(1, 2), Y.col = 2:5,
              other.col = 6)



